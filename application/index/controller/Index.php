<?php
namespace app\index\controller;
use app\common\controller\BaseController;
use think\facade\Config;
use think\facade\Env;
use think\Request;
use think\Db;
use app\index\model\Index as User;
use app\admin\model\Params;
use app\admin\model\Banner;


class Index extends BaseController
{

    /*前置处理*/
    protected $beforeActionList = [
        'header',
        'footer',
    ];
    protected function header()
    {
        $res_header = Banner::where('type','in',[8,9,11])->column('img','type');
        $this->assign('Header', $res_header);
    }
    protected function footer()
    {
        $res_footer = Params::where('type','in',[10,11,12,14,15,16,17])->column('content','type');
        $this->assign('Footer', $res_footer);
    }


    public function index()
    {
        return view('/index');
    }

    public function home()
    {
        //Banner图
        $res_banner = Banner::where('type',1)->select();
        $this->assign('Banner',$res_banner);
        //我们是谁
        $res_who = Params::where('type',4)->select();
        $this->assign('Who',$res_who);
        //服务领域
        $res_ser_cont = Params::where('type',5)->find();
        $res_ser_lab = Params::where('type',6)->select();
        $this->assign('Services',$res_ser_cont);
        $this->assign('ServicesLab',$res_ser_lab);
        //关于我们
        $res_com = Params::where('type',7)->find();
        $res_lab = Params::where('type',8)->select();
        $res_img = Banner::where('type',5)->column('img');
        //var_dump($res_img);die;
        $this->assign('About',['com'=>$res_com,'lab'=>$res_lab,'img'=>$res_img]);
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
