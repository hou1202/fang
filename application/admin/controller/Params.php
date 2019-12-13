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
     *
     * @return \think\Response
     */
    public function company()
    {
        $res = ParamsM::where('type',1)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('params/company');
    }

    /**
     * 显示资源列表-idea
     *
     * @return \think\Response
     */
    public function idea()
    {
        //
        return view('params/idea');
    }

    /**
     * 显示资源列表-evaluate
     *
     * @return \think\Response
     */
    public function evaluate()
    {
        //
        return view('params/evaluate');
    }

    /**
     * 显示资源列表-question
     *
     * @return \think\Response
     */
    public function question()
    {
        //
        return view('params/question');
    }

    /**
     * 显示资源列表-Realm
     *
     * @return \think\Response
     */
    public function realm()
    {
        $res = ParamsM::where('type',5)->find();
        if(!$res) return $this->redirectError('非有效数据信息');
        $this->assign('Params',$res);
        return view('params/realm');
    }

    /**
     * 显示资源列表-term
     *
     * @return \think\Response
     */
    public function term()
    {
        //
        return view('params/term');
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
        $map[] = ['type','=',$type];
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
            $scene = 'c_text';
        }elseif($data['type'] == 2){
            $scene = 'c_images';
        }elseif($data['type'] == 3){
            $scene = 'c_all';
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
        $type_arr=[1=>'text',2=>'images',3=>'all'];
        $this->assign('Params',$res);
        $this->assign('Type',$type_arr[$type]);
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
        if($data['type'] == 'text'){
            $scene = 'text';
        }elseif($data['type'] == 'images'){
            $scene = 'images';
        }elseif($data['type'] == 'all'){
            $scene = 'all';
        }else{
            return $this->failJson('非有效数据信息');
        }
        if(!$validate->scene($scene)->check($data))
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
