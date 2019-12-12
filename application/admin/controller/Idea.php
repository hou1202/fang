<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Params;
use app\admin\validate\Params as ParamsV;
use think\Db;


class Idea extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('idea/index');
    }


    /**
     * 获取列表数据
     *
     * param  \think\Request  $request
     * return kitJson
     */
    public function getData(Request $request)
    {
        $data = $request -> post();
        $map[] = ['id','>',0];
        if(isset($data['keyword']) && !empty($data['keyword'])){
            $map[] = ['id|title','like','%'.trim($data['keyword']).'%'];
        }
        $list = Params::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->select();
        $count = Params::where($map)->count('id');
        return $this->kitJson($list,$count);
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = Params::where('id',$id)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('Idea/edit');
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
        $res = Params::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new ParamsV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/idea') : $this->failJson('更新失败',0);


    }




}
