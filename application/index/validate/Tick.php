<?php

namespace app\index\validate;

use app\common\validate\CommonValidate;


class Tick extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'name' => 'require|max:10',
        'phone' => 'require|number|mobile|length:11,11',
        'company' => 'require|max:30',
        'content' => 'max:250',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'name.require' => '姓名信息不能为空哦~~',
        'name.max' => '姓名信息不能大于10个字呢~~',
        'phone.require' => '联系方式 / 手机号码不能为空哦~~',
        'phone.number' => '联系方式 / 手机号码不对哦~~',
        'phone.mobile' => '联系方式 / 手机号码不对哦~~',
        'phone.length' => '联系方式 / 手机号码不对哦~~',
        'company.require' => '单位信息不能为空哦~~',
        'company.max' => '单位信息不能大于10个字呢~~',
        'content.max' => '说明信息不能大于250个字呢~~',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['name','phone','company','content'],
    ];


}
