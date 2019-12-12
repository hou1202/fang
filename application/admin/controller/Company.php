<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Params;
use app\admin\validate\Params as ParamsV;
use think\Db;


class Company extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $res = Params::get(1);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('company/index');
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = Params::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('company/edit');
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
        if(!$validate->scene('title')->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/company') : $this->failJson('更新失败',0);


    }


}
