<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Banner as BannerM;
use app\admin\validate\Banner as BannerV;
use think\Db;


class Banner extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('banner/index');
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
        $list = BannerM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->append(['type_text'])
            ->select();
        $count = BannerM::where($map)->count('id');
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
        return view('banner/create');
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
        $validate = new BannerV();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());

        return BannerM::create($data) ? $this->successJson('新增成功','/aoogi/banner') : $this->failJson('添加失败',0);
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = BannerM::where('id',$id)->append(['type_text'])->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Banner',$res);
        return view('banner/edit');
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
        $res = BannerM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new BannerV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/banner') : $this->failJson('更新失败',0);


    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return BannerM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }


}
