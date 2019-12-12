<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class Banner extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id|Banner ID' => 'require|number|isExist:banner,id',
        'title|标题' => 'max:100',
        'info|简介说明' => 'max:255',
        'img|图片' => 'require|max:250',

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
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['title','info','img'],
    ];

    /*
     * 定义编辑 edit 模式下，验证场景
     * */
    public function sceneEdit()
    {
        return $this -> only(['title','info','img'])
            ->remove('img','require');
    }
}
