<?php

namespace app\admin\model;

use think\Model;

class Cases extends Model
{
    /*
     * $pk      设置主键
     * 默认为id
     * */
    protected $pk = 'id';

    /*
     *$table    当前模型对应表名，为完整表名
     * */
    protected $table = 'cases';

    /*
     * $readonly    定义只读字段保护
     * */
    protected $readonly = ['id'];

    /*
    * $field   开启数据表字段验证
    * */
    protected $field = true;

    /**
     * 获取类型文字状态
     *
     **/
    public function getClassifyAttr($value, $data) {
        $title = Classify::where('id',$data['classify_id'])->value('title');
        return $title;
    }




}
