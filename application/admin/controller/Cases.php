<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\Request;
use app\admin\model\Classify;
use app\admin\model\Cases as CasesM;
use app\admin\validate\Cases as CasesV;



class Cases extends AdminController
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        return view('cases/index');
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
        $list = CasesM::where($map)
            ->limit(($data['page']-1)*$data['limit'],$data['limit'])
            ->append(['classify'])
            ->select();
        $count = CasesM::where($map)->count('id');
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
        $res = Classify::order('sort desc')->select();
        if(!$res)
            return $this->redirectError('暂无项目分类信息，请先创建项目分类！');
        $this->assign("Classify", $res);
        return view('cases/create');
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
        $validate = new CasesV();
        if(!$validate->scene('create')->check($data))
            return $this->failJson($validate->getError());

        return CasesM::create($data) ? $this->successJson('新增成功','/aoogi/cases') : $this->failJson('添加失败');
    }


    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $res = CasesM::get($id);
        if(!$res) return $this->redirectError('非有效数据信息');
        $res_classify = Classify::order('sort desc')->select();
        $this->assign("Classify", $res_classify);
        $this->assign('Cases',$res);
        return view('cases/edit');
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
        $res = CasesM::get($id);
        if(!$res) return $this->failJson('非有效数据信息');

        $validate = new CasesV();
        if(!$validate->sceneEdit()->check($data))
            return $this->failJson($validate->getError());

        return $res->save($data) ? $this->successJson('更新成功','/aoogi/cases') : $this->failJson('更新失败');


    }

    /**
     * 显示资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $res = CasesM::where('id',$id)->append(['classify'])->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Cases',$res);
        return view('cases/read');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        return CasesM::destroy($id) ? $this->successJson('删除成功') : $this->failJson('删除失败');
    }


}
