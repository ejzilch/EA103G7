<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin-top: 20px;
        }
        /* Component: Chat */
        .chat .chat-wrapper .chat-list-wrapper {
            border: 1px solid #ddd;
            height: 510px;
            overflow-y: auto;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list {
            padding: 0;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li {
            display: block;
            padding: 20px 10px;
            clear: both;
            cursor: pointer;
            border-bottom: 1px solid #ddd;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .avatar {
            margin-right: 12px;
            float: left;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .avatar img {
            width: 60px;
            height: auto;
            border: 4px solid transparent;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .avatar.available img {
            border-color: #2ecc71;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .avatar.busy img {
            border-color: #ff530d;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header {
            margin-top: 4px;
            margin-bottom: 4px;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .username {
            font-weight: bold;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .timestamp {
            float: right;
            color: #999;
            font-size: 11px;
            line-height: 18px;
            font-style: italic;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .timestamp i {
            margin-right: 4px;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li .body p {
            font-size: 12px;
            line-height: 16px;
            max-height: 32px;
            overflow: hidden;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li:hover {
            background-color: #f4f4f4;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li.active {
            background-color: #eee;
            color: black;
        }
        .chat .chat-wrapper .chat-list-wrapper .chat-list li.active .body .timestamp {
            color: black;
        }
        .chat .chat-wrapper .message-list-wrapper {
            border: 1px solid #ddd;
            height: 452px;
            position: relative;
            overflow-y: auto;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list {
            padding: 0;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li {
            display: block;
            padding: 20px 10px;
            clear: both;
            position: relative;
            color: white;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .avatar {
            margin-right: 12px;
            display: block;
            float: left;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .avatar img {
            width: 60px;
            height: auto;
            border: 2px solid transparent;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .avatar.available img {
            border-color: #2ecc71;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .avatar.busy img {
            border-color: #ff530d;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .username {
            float: left;
            display: none;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .timestamp {
            text-align: left;
            display: block;
            color: #999;
            font-size: 11px;
            line-height: 18px;
            font-style: italic;
            margin-bottom: 4px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .timestamp i {
            margin-right: 4px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .body {
            display: block;
            width: 87%;
            float: left;
            position: relative;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .body .message {
            font-size: 12px;
            line-height: 16px;
            display: inline-block;
            width: auto;
            background: #2ecc71;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .body .message:before {
            content: '';
            display: block;
            position: absolute;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 9px 9px 9px 0;
            border-color: transparent #2ecc71 transparent transparent;
            left: 0;
            top: 10px;
            margin-left: -8px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .body .message a.white {
            color: white;
            font-weight: bolder;
            text-decoration: underline;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.left .body .message img {
            max-width: 320px;
            max-height: 320px;
            width: 100%;
            height: auto;
            margin-bottom: 5px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .avatar {
            margin-left: 12px;
            display: block;
            float: right;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .avatar img {
            width: 60px;
            height: auto;
            border: 2px solid transparent;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .avatar.available img {
            border-color: #2ecc71;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .avatar.busy img {
            border-color: #ff530d;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .username {
            float: right;
            display: none;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .timestamp {
            text-align: right;
            display: block;
            color: #999;
            font-size: 11px;
            line-height: 18px;
            font-style: italic;
            margin-bottom: 4px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .timestamp i {
            margin-right: 4px;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .body {
            display: block;
            width: 87%;
            float: right;
            position: relative;
            text-align: right;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .body .message {
            font-size: 12px;
            line-height: 16px;
            display: inline-block;
            width: auto;
            background: #3498db;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .body .message:after {
            content: '';
            display: block;
            position: absolute;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 9px 9px 9px 0;
            border-color: transparent #3498db transparent transparent;
            right: 0;
            top: 10px;
            margin-right: -7px;
            -moz-transform: rotate(180deg);
            -o-transform: rotate(180deg);
            -webkit-transform: rotate(180deg);
            -ms-transform: rotate(180deg);
            transform: rotate(180deg);
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .body .message a.white {
            color: white;
            font-weight: bold;
        }
        .chat .chat-wrapper .message-list-wrapper .message-list li.right .body .message img {
            max-width: 320px;
            max-height: 320px;
            width: 100%;
            height: auto;
            margin-bottom: 5px;
        }
        .chat .chat-wrapper .compose-area {
            padding: 10px 0;
            text-align: right;
        }
        .chat .chat-wrapper .compose-box {
            padding: 10px 0;
        }
        .chat .chat-wrapper .recipient-box {
            padding: 10px 0;
        }
        .chat .chat-wrapper .recipient-box .bootstrap-tagsinput {
            display: block;
            width: 100%;
            margin-bottom: 0;
        }
        @media (max-width: 767px) {
            .chat .chat-wrapper .chat-list-wrapper {
                border: 1px solid #ddd;
                height: 300px;
                overflow-y: auto;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list {
                padding: 0;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li {
                display: block;
                padding: 20px 10px;
                clear: both;
                border-bottom: 1px solid #ddd;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .avatar {
                display: none;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header {
                margin-top: 4px;
                margin-bottom: 4px;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .username {
                font-weight: bold;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .timestamp {
                float: right;
                color: #999;
                font-size: 11px;
                line-height: 18px;
                font-style: italic;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .body .header .timestamp i {
                margin-right: 4px;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li .body p {
                display: none;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li.active {
                color: black;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li.active .body .timestamp {
                color: black;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li.new {
                font-weight: bolder;
            }
            .chat .chat-wrapper .chat-list-wrapper .chat-list li.new .body .timestamp {
                font-weight: bolder;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.left .avatar {
                display: none;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.left .username {
                display: inline-block;
                margin-right: 10px;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.left .body {
                width: 100%;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.right .avatar {
                display: none;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.right .username {
                display: inline-block;
                margin-left: 10px;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.right .timestamp {
                text-align: right;
                display: block;
                color: #999;
                font-size: 11px;
                line-height: 18px;
                font-style: italic;
                margin-bottom: 4px;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.right .timestamp i {
                margin-right: 4px;
            }
            .chat .chat-wrapper .message-list-wrapper .message-list li.right .body {
                width: 100%;
            }
            .chat .chat-wrapper .recipient-box {
                margin-top: 30px;
            }
        }

        .btn-green {
            background-color: #2ecc71;
            border-color: #27ae60;
            color: white;
        }

        .mg-btm-10 {
            margin-bottom: 10px !important;
        }

        .panel-white {
            border: 1px solid #dddddd;
        }
        .panel {
            border-radius: 0;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://91.234.35.26/iwiki-admin/v1.0.0/admin/js/jquery.nicescroll.min.js"></script>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-white border-top-green">
                    <div class="panel-body chat">
                        <div class="row chat-wrapper">
                            <div class="col-md-4">
                                <div>
                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 550px;">
                                        <div class="chat-list-wrapper" style="overflow-y: auto; width: auto; height: 550px;">
                                            <ul class="chat-list">
                                                <li class="new">
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Gavin Free</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>1 secs ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            Hey, have you finished up with the Ladybug project?
                                                        </p>
                                                    </div>
                                                </li>
                                                <li class="active">
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Yanique Robinson</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>3 secs ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            Cool. I'll see you guys then.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Ryan Haywood</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>12 mins ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            Kevin, tomorrow is GoT night at my house. Bring your HDMI extension. Thanks.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Geoff Ramsey</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>1 hour ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            Sales want to see you. Something about the new product.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Kara Mendly</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>5 hours ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            Meeting next week Tuesday. Nothing serious, just bring teams work progress with you.
                                                        </p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="body">
                                                        <div class="header">
                                                            <span class="username">Jack Patillo</span>
                                                            <small class="timestamp text-muted">
                                                                <i class="fa fa-clock-o"></i>12 mins ago
                                                            </small>
                                                        </div>
                                                        <p>
                                                            hey, what does this error mean?
                                                        </p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 478.639px; background: rgb(0, 0, 0);"></div>
                                        <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="recipient-box">
                                    <select data-placeholder=" " class="form-control chzn-select chzn-done" multiple="" style="display: none;">
                                        <option value="k.mckoy@ztapps.com">Kevin Mckoy</option>
                                        <option value="y.robinson@ztapps.com" selected="">Yanique Robinson</option>
                                        <option value="gavino@ztapps.com">Gavino Free</option>
                                        <option value="ggeoff@ztapps.com">Geoff Ramsey</option>
                                        <option value="kkara@ztapps.com">Kara Kingsley</option>
                                        <option value="barbs@ztapps.com">Barbara Dundkleman</option>
                                    </select>
                                </div>
                                <div>
                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 452px;">
                                        <div class="message-list-wrapper" style="overflow: hidden; width: auto; height: 452px;">
                                            <ul class="message-list">
                                                <li class="left">
                                                    <span class="username">Yanique Robinson</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>9 mins ago
                                                    </small>
                                                    <span class="avatar available tooltips" data-toggle="tooltip " data-placement="right" data-original-title="Yanique Robinson">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Hey, are you busy at the moment?
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="right">
                                                    <span class="username">Kevin Mckoy</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>5 mins ago
                                                    </small>
                                                    <span class="avatar tooltips" data-toggle="tooltip " data-placement="left" data-original-title="Kevin Mckoy">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Um, no actually. I've just wrapped up my last project for the day.
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="message well well-sm">
                                                            Whats up?
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="left">
                                                    <span class="username">Yanique Robinson</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>3 mins ago
                                                    </small>
                                                    <span class="avatar available tooltips" data-toggle="tooltip " data-placement="right" data-original-title="Yanique Robinson">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Well, I wanted to find out if you have any plans for tonight.
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="message well well-sm">
                                                            <p><a href="#" class="white">Barbara</a> and I are going to this restaurant out of town.</p>
                                                            <img src="https://via.placeholder.com/300x200" alt="">
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="right">
                                                    <span class="username">Kevin Mckoy</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>2 mins ago
                                                    </small>
                                                    <span class="avatar tooltips" data-toggle="tooltip " data-placement="left" data-original-title="Kevin Mckoy">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Wow that sounds great.
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="left">
                                                    <span class="username">Yanique Robinson</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>56 secs ago
                                                    </small>
                                                    <span class="avatar available tooltips" data-toggle="tooltip " data-placement="right" data-original-title="Yanique Robinson">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Ok! We'll swing by your office at 5.
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="right">
                                                    <span class="username">Kevin Mckoy</span>
                                                    <small class="timestamp">
                                                        <i class="fa fa-clock-o"></i>3 secs ago
                                                    </small>
                                                    <span class="avatar tooltips" data-toggle="tooltip " data-placement="left" data-original-title="Kevin Mckoy">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar" class="img-circle">
                                                    </span>
                                                    <div class="body">
                                                        <div class="message well well-sm">
                                                            Cool. I'l see you guys then.
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="slimScrollBar" style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 478.639px; background: rgb(0, 0, 0);"></div>
                                        <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
                                    </div>
                                    <div class="compose-box">
                                        <div class="row">
                                            <div class="col-xs-12 mg-btm-10">
                                                <textarea id="btn-input" class="form-control input-sm" placeholder="Type your message here..."></textarea>
                                            </div>
                                            <div class="col-xs-12">
                                                <button class="btn btn-green btn-sm pull-right">
                                                    <i class="fa fa-location-arrow"></i> Send
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".message-list-wrapper").niceScroll();
            $(".chat-list-wrapper").niceScroll();
        })
    </script>
</body>

</html>