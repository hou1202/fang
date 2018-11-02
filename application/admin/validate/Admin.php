<?php

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'id' => 'require|number',
        'account|帐户' => 'require|length:5,20|unique:adminer',
        'password|帐户密码' => 'require|length:6,20',
        'name|真实姓名' => 'require|length:2,10',
        'status' => 'in:0,1',
        'permissions_id|所属权限组' => 'require|number|gt:0',
        'remark|备注内容' => 'max:255',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'id.required' => '提交内容为非有效信息',
        'id.number' => '提交内容为非有效信息',
        'status.in' => '提交内容为非有效信息',
        'permissions_id.number' => '所属权限组为非有效信息',
        'permissions_id.gt' => '所属权限组为非有效信息',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'status' => ['id','status'],
        'save' => ['account','password','name','status','permissions_id','remark']
    ];
}