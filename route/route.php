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

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});
Route::rule('/','index/index','get');
Route::get('test','index/index/test');
Route::get('hello','index/index/hello');

//主体框架加载Route
Route::get('admin','admin/home/home');
Route::get('main','admin/home/main');

//导航栏加载
Route::get('menu','admin/home/menu');

//管理员管理Route
Route::get('adminer','admin/admin/index');
Route::get('adminer_data','admin/admin/indexData');
Route::post('adminer_status','admin/admin/setAdminStatus');
Route::get('adminer_create','admin/admin/create');
Route::post('adminer_store','admin/admin/save');

//路由管理Route
Route::resource('router','admin/router')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('router/data','admin/router/routerData');
Route::post('router/status','admin/router/setRouterStatus');


//权限管理permission
Route::resource('permission','admin/permission')->rest('edit',['GET', '/edit/:id','edit']);
Route::post('permission/data','admin/permission/permissionData');
Route::post('permission/status','admin/permission/setPermissionStatus');


Route::get('setting','admin/set/index');
Route::get('table_two','admin/set/tableTwo');



return [

];
