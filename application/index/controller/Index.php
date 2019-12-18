<?php
namespace app\index\controller;
use app\admin\model\Cases;
use app\admin\model\Classify;
use app\common\controller\BaseController;
use think\Request;
use think\Db;
use app\admin\model\Params;
use app\admin\model\Banner;
use app\index\validate\Tick;
use app\common\model\Tickling;
use app\admin\model\News;
use app\admin\model\Team;
use app\admin\model\Services;



class Index extends BaseController
{

    /*前置处理*/
    protected $beforeActionList = [
        'header',
        'footer'=>  ['except'=>'errors'],
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
        $this->assign('About',['com'=>$res_com,'lab'=>$res_lab,'img'=>$res_img]);
        //评论
        $res_discus = Params::where('type',3)->select();
        $this->assign('Discus',$res_discus);
        //合作伙伴
        $res_partner = Banner::where('type',7)->column('img','id');
        $this->assign('Partner',$res_partner);
        //最新动态
        $res_news = News::field('title,info,create_time,thumbnail')->limit(0,10)->order("id desc")->select();
        $this->assign("News",$res_news);
        return view('/home');
    }

    public function about()
    {
        $res_com = Params::where('type',1)->find();
        $res_idea = Params::where('type',2)->select();
        $res_img = Banner::where('type',10)->column('img');
        $this->assign('About',['com'=>$res_com,'idea'=>$res_idea,'img'=>$res_img]);

        //评论
        $res_discus = Params::where('type',3)->select();
        $this->assign('Discus',$res_discus);
        //团队
        $res_team = Team::order('sort desc')->select();
        $this->assign('Team',$res_team);
        return view('/about');
    }

    public function service()
    {
        $res_ban = Banner::where('type',2)->find();
        $res_tit = Params::where('type',9)->find();
        $res_ser = Services::field('id,title,info,thumbnail')->select();
        $this->assign('Banner',$res_ban);
        $this->assign('Title',$res_tit);
        $this->assign('Services',$res_ser);
        return view('/service');
    }

    public function serviceDetail($id)
    {
        $res = Services::get($id);
        if(!$res)
            $this->redirect('/errors');
        $res_lab = $res->servicesLabel;
        $this->assign('Services',$res);
        $this->assign('Labels',$res_lab);
        return view('/service-detail');
    }

    public function project()
    {
        $res_ban = Banner::where('type',3)->find();
        $res_class = Classify::order('sort desc')->select();
        $res_case = Cases::order('id desc')->append(['labels'])->select();
        $this->assign('Banner',$res_ban);
        $this->assign('Classify',$res_class);
        $this->assign('Case',$res_case);
        return view('/project');
    }

    public function projectDetail($id)
    {
        $res = Cases::where('id',$id)->append(['classify'])->find();
        if(!$res)
            $this->redirect('/errors');
        $this->assign('Case',$res);
        return view('/project-detail');
    }

    public function blog()
    {
        $res_ban = Banner::where('type',4)->find();
        $res_news = News::field('id,title,info,thumbnail,create_time')->order('id desc')->select();
        $this->assign('Banner',$res_ban);
        $this->assign('News',$res_news);
        return view('/blog');
    }

    public function blogDetail($id)
    {
        $res = News::get($id);
        if(!$res)
            $this->redirect('/errors');
        $this->assign('News',$res);
        return view('/blog-detail');
    }

    public function contact()
    {
        $res_cont = Params::where('type','in',[13,18])->column('content','type');
        $this->assign('Cont', $res_cont);
        return view('/contact');
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function tick(Request $request)
    {
        $data = $request->param();
        $validate = new Tick();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());
        return Tickling::create($data) ? $this->successJson('您的问题已经成功提交~~') : $this->failJson('抱歉，提交失败，请重新提交~~');
    }

    public function errors()
    {
        return view('/error');
    }


}
