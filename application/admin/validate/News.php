<?php

namespace app\admin\validate;

use app\common\validate\CommonValidate;


class News extends CommonValidate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
	    'id' => 'require|number|isExist:news,id',
        'title|标题' => 'require|max:100',
        'img|展示图' => 'require|max:250',
        'thumbnail|缩略图' => 'require|max:250',
        'author|作者' => 'require|max:20',
        'labels|动态标签' => 'require|max:20',
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
    ];

    /*
     * 定义验证场景
     * 格式：'场景名' => ['字段名1','字段名2']
     * */
    protected $scene = [
        'create' => ['title','img','thumbnail','author','labels','content'],
    ];

    /*
     * 定义编辑 edit 模式下，验证场景
     * */
    public function sceneEdit()
    {
        return $this -> only(['title','img','thumbnail','author','labels','content'])
            ->remove('img','require')
            ->remove('thumbnail','require');
    }
}
