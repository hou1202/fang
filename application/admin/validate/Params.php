<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class Params extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id|ID' => 'require|number|isExist:params,id',
        'title|标题' => 'require|max:255',
        'img|图片' => 'require|max:250',
        'content|内容' => 'require',
        'type' => 'require|in:1,2,3'

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
        'type.require' => '非有效数据信息',
        'type.in' => '非有效数据信息',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'text' => ['title','content'],
        'images' => ['title','img'],
        'all' => ['title','img','content'],
        'c_all' => ['title','img','content','type'],
    ];


}
