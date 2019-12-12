<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/*
 * 后台管理模块路由-admin
 * 后台管理模块路由约定使用aoogi前缀
 * 例： aoogi/*
 * */

//设置全局变量规则
/*Route::pattern([
    'id'   => '\d+',
]);*/


Route::get('login','admin/login/index');

//后台管理模块路由-admin

Route::get('setting','admin/set/index');
Route::get('table_two','admin/set/tableTwo');

//主体框架加载Route
Route::get('admin','admin/home/home');
Route::get('aoogi/main','admin/home/main');
Route::post('aoogi/logout','admin/home/logout');
Route::get('aoogi/menu','admin/home/menu');                   //导航栏加载
Route::post('aoogi/opts','admin/home/opts');                   //导航栏加载
Route::get('aoogi/error','admin/error/index');      //ERROR页面

//登录Route
Route::get('adminLogin','admin/login/index');
Route::post('adminLogin','admin/login/login');

//管理员管理Route
Route::resource('aoogi/adminer','admin/admin')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('aoogi/adminer/data','admin/admin/getData');
Route::post('aoogi/adminer/status','admin/admin/setStatus');

//路由管理Route
Route::resource('aoogi/router','admin/router')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('aoogi/router/data','admin/router/getData');
Route::post('aoogi/router/status','admin/router/setStatus');
Route::get('aoogi/router/create_modular','admin/router/createModular');
Route::post('aoogi/router/save_modular','admin/router/saveModular');

//权限管理permission
Route::resource('aoogi/permission','admin/permission')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('aoogi/permission/data','admin/permission/getData');
Route::post('aoogi/permission/status','admin/permission/setStatus');

//参数设置模块config
Route::resource('aoogi/config','admin/config')->rest('edit',['GET', '/edit/:id','edit'])->except(['read']);
Route::post('aoogi/config/data','admin/config/getData');

//Banner图banner
Route::resource('aoogi/banner','admin/banner')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('aoogi/banner/data','admin/banner/getData');

//基本配置信息
Route::get('aoogi/params/:type','admin/params/create');
Route::post('aoogi/params','admin/params/save');
Route::get('aoogi/params/edit/:type/:id','admin/params/edit');
Route::put('aoogi/params/:id','admin/params/update');
Route::delete('aoogi/params/:id','admin/params/delete');
Route::post('aoogi/params/data/:type','admin/params/getData');


Route::get('aoogi/params/company','admin/params/company');      //企业简介
Route::get('aoogi/params/idea','admin/params/idea');        //核心理念
Route::get('aoogi/params/evaluate','admin/params/evaluate');        //客户评价





//图片上传处理
Route::post('uploader/[:genre]','admin/Uploader/uploader')->pattern(['genre' => '1']);

return [

];
