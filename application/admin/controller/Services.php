<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Services as ServicesM;
use app\admin\validate\Services as ServicesV;
use app\admin\model\ServicesLabel as ServicesLabelM;
use app\admin\validate\ServicesLabel;
use think\Db;


class Services extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('services/index');
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
        $list = ServicesM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->order('id desc')
            ->select();
        $count = ServicesM::where($map)->count('id');
        return $this->kitJson($list,$count);
    }



    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        return view('services/create');
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
        //验证主数据
        $validate = new ServicesV();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());
        //验证标签数据
        $val_label = new ServicesLabel();
        foreach($data['labels'] as $value){
            if(!$val_label->scene('create')->check($value))
                return $this->failJson($val_label->getError());
        }

        //事务提交
        Db::startTrans();
        try {
            $res = ServicesM::create($data);
            $res->servicesLabel()->saveAll($data['labels']);
            Db::commit();
        } catch(\Exception $e) {
            // 回滚事务
            Db::rollback();
            return $this->failJson('添加失败');
        }
        return $this ->successJson('新增成功','/aoogi/services');
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = ServicesM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $res_label = ServicesLabelM::where('services_id', $id)->select();
        $this->assign('Labels', $res_label);
        $this->assign('Services', $res);
        return view('services/edit');
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
        $res = ServicesM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        //验证主数据
        $validate = new ServicesV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        //验证标签数据
        $val_label = new ServicesLabel();
        foreach($data['labels'] as $value){
            if(!$val_label->scene('create')->check($value))
                return $this->failJson($val_label->getError());
        }

        Db::startTrans();
        try {
            $res->save($data);
            $res->servicesLabel()->saveAll($data['labels']);
            Db::commit();
        } catch(\Exception $e) {
            // 回滚事务
            Db::rollback();
            return $this->failJson('更新失败');
        }
        return $this->successJson('更新成功','/aoogi/services');



    }

    /**
     * 显示资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {

        $res = ServicesM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $res_label = ServicesLabelM::where('services_id', $id)->select();
        $this->assign('Labels', $res_label);
        $this->assign('Services', $res);
        return view('services/read');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        Db::startTrans();
        try {
            ServicesLabelM::where("services_id", $id)->delete();
            ServicesM::destroy($id);
            Db::commit();
        } catch(\Exception $e) {
            // 回滚事务
            Db::rollback();
            return $this->failJson('删除失败');
        }
        return $this->successJson('删除成功');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delLabel($id)
    {
        return ServicesLabelM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }


}
