<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class Cases extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:cases,id',
        'title|标题' => 'require|max:100',
        'classify_id' => 'require|number|isExist:classify,id',
        'img|展示图' => 'require|max:250',
        'thumbnail|缩略图' => 'require|max:250',
        'address|位置信息' => 'require|max:30',
        'projects|项目名称' => 'require|max:50',
        'find_time|完成时间' => 'require|date',
        'leader|项目负责人' => 'require|max:20',
        'content|项目介绍' => 'require',

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
        'classify_id.require' => '非有效数据信息',
        'classify_id.number' => '非有效数据信息',
        'classify_id.isExist' => '非有效数据信息',
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['title','classify_id','img','thumbnail','address','projects','find_time','leader','content'],
    ];

    /*
     * 定义编辑 edit 模式下，验证场景
     * */
    public function sceneEdit()
    {
        return $this -> only(['title','classify_id','img','thumbnail','address','projects','find_time','leader','content'])
            ->remove('img','require')
            ->remove('thumbnail','require');
    }
}
