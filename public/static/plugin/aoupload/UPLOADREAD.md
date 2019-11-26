UPLOAD说明
    使用时引入文件
        jquery/js
        webuploader/js
        globle/css
        diyUpload/js
        
    diyUpload为原版本
    singleUpload为修改版本，加入了适用于单张图片上传优化的内容
        singleUp/css
        singleUpload/js
        
    初始化
         $('#IdUpload').diyUpload({
                buttonText : '',
                //类型限制;
                accept: {
                    title: "Images",
                    extensions: 'jpg,jpeg,png'
                },
                //配置生成缩略图的选项
                thumb:{
                    width:120,
                    height:120,
                    quality:100,
                    allowMagnify:true,
                    crop:true,
                    type:"image/jpeg"      // 为空的话则保留原有图片格式。 否则强制转换成指定的类型(image/jpeg)。
                },
                swf:"/static/plugin/aoupload/Uploader.swf",
                //是否支持多文件上传
                multiple:false,
                //设置为 true 后，不需要手动调用上传，有文件选择即开始上传
                auto:true,
                //文件上传方式,POST或者GET
                method:"POST",
                //服务器地址;
                server:'/uploader',
                //最大上传的文件数量
                fileNumLimit:5,
                //总文件大小(单位字节);
                fileSizeLimit:500000 * 1024,
                //单个文件大小(单位字节);
                fileSingleSizeLimit:50000 * 1024,
                //自定义内容信息
                custom:{
                    inputName:'img',
                    //input加入ID，只适用于单个上传图片
                    inputId:'img_id',
                    //是否开启单图上传，true|false
                    single:true
                },
                success:function( data ) {
                    //成功时返回处理
                },
                error:function( err ) { 
                    //失败时返回处理
                }
            });