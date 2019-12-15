<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\common\model\Tickling as TicklingM;
use app\common\validate\Tickling as TicklingV;



class Tickling extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('tickling/index');
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
            $map[] = ['name|phone','like','%'.trim($data['keyword']).'%'];
        }
        $list = TicklingM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->order('id desc')
            ->select();
        $count = TicklingM::where($map)->count('id');
        return $this->kitJson($list,$count);
    }

    /**
     * 设置状态
     *
     * param  \think\Request  $request
     * return Json
     */
    public function setStatus(Request $request)
    {
        $data = $request -> post();
        $validate = new TicklingV();
        if(!$validate->scene('status')->check($data))
            return $this->failJson($validate->getError());

        $route = TicklingM::get($data['id']);
        return $route->save($data) ? $this->successJson('状态更新成功') : $this->failJson('状态更新失败');
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = TicklingM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Tickling',$res);
        return view('tickling/edit');
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
        $res = TicklingM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new TicklingV();
        if(!$validate->scene('update')->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/tickling') : $this->failJson('更新失败');


    }

    /**
     * 显示资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $res = TicklingM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Tickling',$res);
        return view('tickling/read');
    }



}
