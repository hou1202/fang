<?php
namespace app\index\controller;
use app\common\controller\BaseController;
use think\facade\Config;
use think\facade\Env;
use think\Request;
use think\Db;
use app\index\model\Index as User;


class Index extends BaseController
{
    public function index()
    {
        return view('/index');
    }

    public function home()
    {
        return view('/home');
    }

    public function about()
    {
        return view('/about');
    }

    public function service()
    {
        return view('/service');
    }

    public function serviceDetail()
    {
        return view('/service-detail');
    }

    public function project()
    {
        return view('/project');
    }

    public function projectDetail()
    {
        return view('/project-detail');
    }

    public function blog()
    {
        return view('/blog');
    }

    public function blogDetail()
    {
        return view('/blog-detail');
    }

    public function contact()
    {
        return view('/contact');
    }


}
