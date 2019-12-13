<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Team as TeamM;
use app\admin\validate\Team as TeamV;
use think\Db;


class Team extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('team/index');
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
        $list = TeamM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->select();
        $count = TeamM::where($map)->count('id');
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
        return view('team/create');
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
        $validate = new TeamV();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());

        return TeamM::create($data) ? $this->successJson('新增成功','/aoogi/team') : $this->failJson('添加失败',0);
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = TeamM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Team',$res);
        return view('team/edit');
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
        $res = TeamM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new TeamV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/team') : $this->failJson('更新失败',0);

    }

    /**
     * 显示资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $res = TeamM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Team',$res);
        return view('team/read');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return TeamM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }


}
