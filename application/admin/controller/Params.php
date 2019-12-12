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
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/idea') : $this->failJson('更新失败',0);


    }




}
