<?php

namespace app\admin\model;

use think\Model;

class Banner extends Model
{
    /*
     * $pk      设置主键
     * 默认为id
     * */
    protected $pk = 'id';

    /*
     *$table    当前模型对应表名，为完整表名
     * */
    protected $table = 'banner';

    /*
     * $readonly    定义只读字段保护
     * */
    protected $readonly = ['id','type'];

    /*
    * $field   开启数据表字段验证
    * */
    protected $field = true;

    /**
     * 获取类型文字状态
     *
     **/
    public function getTypeTextAttr($value, $data) {
        $arr = [
            1=> '首页滚动Banner图',
            2=> '服务内容Banner图',
            3=> '合作项目Banner图',
            4=> '最新动态Banner图',
            5=> '首页企业展示图',
            6=> '首页商务服务背景图',
            7=> '合作伙伴Logo',
            8=> '头部企业Logo',
            9=> '尾部企业Logo',
            10=> '关于我们Logo图',
            11=> '尾部二维码',
        ];
        return $arr[$data['type']];
    }


}
