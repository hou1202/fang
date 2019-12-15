<?php

namespace app\common\validate;
use app\common\validate\CommonValidate;


class Tickling extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:tickling,id',
        'name|姓名' => 'require|max:15',
        'phone|联系方式' => 'require|mobile',
        'company|单位名称' => 'max:30',
        'content|内容' => 'require',
        'status|处理状态' => 'in:0,1',
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
        'name.require' => '提交姓名不能为空',
        'name.max' => '提交姓名信息不能大于15个字',
        'phone.require' => '联系方式不能为空',
        'phone.mobile' => '提交联系方式非有效手机号码',
        'company.max' => '提交单位名称不能大于30个字',
        'content.require' => '反馈内容不能不空',
        'status.处理状态' => '处理状态信息有误',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['name','phone','company','content'],
        'update' => ['status'],
        'status' => ['id','status'],
    ];

}
