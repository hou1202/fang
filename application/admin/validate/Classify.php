<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class Classify extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:classify,id',
        'title|分类名称' => 'require|max:30',
        'labels|分类标签' => 'require|length:5,30|alphaDash|isUpdateExist:classify,labels',
        'sort|排序' => 'egt:0|elt:100',

    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'id.require' => '非有效数据信息',
        'id.number' => '非有效数据信息',
        'id.isExist' => '非有效数据信息',
        'labels.isUpdateExist' => '分类标签不得重复',
        'labels.alphaDash' => '分类标签只能为：字母 或 下划线 或 中划线',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['title', 'sort', 'labels'],
    ];

}
