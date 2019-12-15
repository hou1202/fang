<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\News as NewsM;
use app\admin\validate\News as NewsV;



class News extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('news/index');
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
            $map[] = ['author|title|labels','like','%'.trim($data['keyword']).'%'];
        }
        $list = NewsM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->order('id desc')
            ->select();
        $count = NewsM::where($map)->count('id');
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
        return view('news/create');
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
        $validate = new NewsV();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());

        return NewsM::create($data) ? $this->successJson('新增成功','/aoogi/news') : $this->failJson('添加失败');
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = NewsM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('News',$res);
        return view('news/edit');
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
        $res = NewsM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new NewsV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/news') : $this->failJson('更新失败');


    }

    /**
     * 显示资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $res = NewsM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('News',$res);
        return view('news/read');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return NewsM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }


}
