<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class Team extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:team,id',
        'name|姓名' => 'require|max:15',
        'posts|职位' => 'require|max:30',
        'school|毕业院校' => 'require|max:30',
        'img|图片' => 'require|max:250',
        'info|简介' => 'require',
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
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['name','posts','school','img','info','sort'],
    ];

    /*
     * 定义编辑 edit 模式下，验证场景
     * */
    public function sceneEdit()
    {
        return $this -> only(['name','posts','school','img','info','sort'])
            ->remove('img','require');
    }
}
