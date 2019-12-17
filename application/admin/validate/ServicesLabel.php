<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class ServicesLabel extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:services_label,id',
	    'services_id' => 'require|number|isExist:services,id',
        'label_title|标签标题' => 'require|max:200',
        'label_icon|标签图标' => 'require|max:40',
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
        'services_id.require' => '非有效数据信息',
        'services_id.number' => '非有效数据信息',
        'services_id.isExist' => '非有效数据信息',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['label_title','label_icon'],
    ];


}
