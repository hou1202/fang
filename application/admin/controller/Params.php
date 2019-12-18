<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Params as ParamsM;
use app\admin\validate\Params as ParamsV;
use think\Db;


class Params extends AdminController
{

    /**
     * 显示资源列表-Company
     * 企业介绍
     * type => 1
     * number => 1
     *
     * @return \think\Response
     */
    public function company()
    {
        $res = ParamsM::where('type',1)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('params/single_page');
    }

    /**
     * 显示资源列表-idea
     * 核心理念
     * type => 2
     * number => 4
     *
     * @return \think\Response
     */
    public function idea()
    {
        //
        $this->assign('Type',2);
        return view('params/two_text_page');
    }

    /**
     * 显示资源列表-evaluate
     * 客户评价
     * type => 3
     * number => --
     * @return \think\Response
     */
    public function evaluate()
    {
        //
        $this->assign('Type',3);
        return view('params/evaluate');
    }

    /**
     * 显示资源列表-question
     * 首页三问
     * type => 4
     * number => 3
     *
     * @return \think\Response
     */
    public function question()
    {
        //
        $this->assign('Type',4);
        return view('params/three_img_page');
    }

    /**
     * 显示资源列表-Realm
     * 首页服务领域
     * type => 5
     * number => 1
     *
     * @return \think\Response
     */
    public function realm()
    {
        $res = ParamsM::where('type',5)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('params/single_page');
    }

    /**
     * 显示资源列表-term
     * 领域四项
     * type => 6
     * number => 4
     *
     * @return \think\Response
     */
    public function term()
    {
        //
        $this->assign('Type',6);
        return view('params/two_text_page');
    }

    /**
     * 显示资源列表-homeCompany
     * 首页公司简介
     * type => 7
     * number => 1
     *
     * @return \think\Response
     */
    public function homeCompany()
    {
        $res = ParamsM::where('type',7)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('params/single_page');
    }



    /**
     * 显示资源列表-companyLabel
     * 首页公司标签
     * type => 8
     * number => 3
     *
     * @return \think\Response
     */
    public function companyLabel()
    {
        //
        $this->assign('Type',8);
        return view('params/two_text_page');
    }


    /**
     * 显示资源列表-serviceInfo
     * 服务内容页面简介
     * type => 9
     * number => 1
     *
     * @return \think\Response
     */
    public function serviceInfo()
    {
        //
        $this->assign('Type',9);
        return view('params/two_text_page');
    }


    /**
     * 显示资源列表-dispose
     * 基本配置参数
     * type => 10
     * number --
     *
     * @return \think\Response
     */
    public function dispose()
    {
        /**
         * 公司名称     =>  10
         * 商务邮箱     =>  11
         * 联系电话1    =>  12
         * 联系电话2    =>  13
         * 办公地址     =>  14
         * 网址        =>  15
         * 版权说明     =>  16
         * 尾部简介     =>  17
         * 联系我们简介     =>  17
        */
        $this->assign('Type',10);
        return view('params/dispose_list');
    }



    /**
     * 获取列表数据
     *
     * param  \think\Request  $request
     * return kitJson
     */
    public function getData(Request $request, $type)
    {
        $data = $request -> post();
        $map[] = ['id','>',0];
        if($type == 10){
            $map[] = ['type','in',[10,11,12,13,14,15,16,17,18]];
        }else{
            $map[] = ['type','=',$type];
        }

        if(isset($data['keyword']) && !empty($data['keyword'])){
            $map[] = ['id|title','like','%'.trim($data['keyword']).'%'];
        }
        $list = ParamsM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->select();
        $count = ParamsM::where($map)->count('id');
        return $this->kitJson($list,$count);
    }

    /**
     * 显示创建资源表单页.
     *
     * @param  int  $type
     * @return \think\Response
     */
    public function create($type)
    {
        $this->assign('Type',$type);
        return view('params/create');
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
        $data = $request -> post();
        $validate = new ParamsV();
        if($data['type'] == 1){
            $scene = 'c_text';      //未定义
        }elseif($data['type'] == 2){
            $scene = 'c_images';    //未定义
        }elseif($data['type'] == 3){
            $scene = 'c_all';       //验证标题+简介+图片
        }else{
            return $this->failJson('非有效数据信息');
        }
        if(!$validate->scene($scene)->check($data))
            return $this->failJson($validate->getError());
        return ParamsM::create($data) ? $this->successJson('新增成功') : $this->failJson('添加失败');
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $type
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($type, $id)
    {
        $res = ParamsM::where('id',$id)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        $type_arr=[1=>'text',2=>'images',3=>'all',4=>'dispose'];
        $this->assign('Type',$type_arr[$type]);
        if($type == 4)
            return view('params/dispose');
        return view('params/edit');
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {

        $data = $request -> post();
        $res = ParamsM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new ParamsV();

        /**
         * text     =>      验证标题+简介
         * images   =>      验证标题+图片
         * all      =>      验证标题+简介+图片
         * dispose  =>      验证简介
         */
        if(!$validate->scene($data['type'])->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功') : $this->failJson('更新失败');


    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return ParamsM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }



}
