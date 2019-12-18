<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
//


//设置全局变量规则
Route::pattern([
    'id'   => '\d+',
    'goods_id'  => '\d+',
    'coupon_id'  => '\d+',
    'address_id'  => '\d+',
    'order_id'  => '\d+',
    'type'  => '\d+',
    'page'  => '\d+',
    'limit'  => '\d+',
]);

/*
 *
 * 前端路由处理模块
 *
 * */
Route::get('/','index/index/index');
Route::get('/home','index/index/home');
Route::get('/about','index/index/about');
Route::get('/service','index/index/service');
Route::get('/service-detail/:id','index/index/serviceDetail');
Route::get('/project','index/index/project');
Route::get('/project-detail/:id','index/index/projectDetail');
Route::get('/blog','index/index/blog');
Route::get('/blog-detail/:id','index/index/blogDetail');
Route::get('/contact','index/index/contact');
Route::post('/tick','index/index/tick');
Route::get('/errors','index/index/errors');






//miss路由：没有匹配路由时执行
//Route::miss('/');
//获取验证码处理
Route::post('/getCode/:mobile/:type/[:over]','index/Verify/getCode');
//图片上传处理
Route::get('uploader','admin/Uploader/uploader');





















return [

];
