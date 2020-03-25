# dailyfresh_django
django3.0 开发的天天生鲜项目


### 本项目所需要的库

```
pip install Django              # django框架			3.0.4
pip install django-tinymce      # 富文本编辑器		2.8.0
pip install Pillow              # ImageField使用		7.0.0
pip install PyMySQL             # mysql数据库		0.9.3	
pip install django-redis        # redis数据库      4.11.0
pip install py3Fdfs
pip install django-haystack
pip install whoosh
pip install jieba               # 分词    0.42.1
pip install python-alipay-sdk --upgrade     # 支付宝支付的插件  
```

- [集成fastdfs图片上传框架](https://www.jianshu.com/p/7cccbdd36602)
本项目没有用到，本项目采用了django自带的图片上传方式
- [django集成whoosh全局搜索引擎](https://www.jianshu.com/p/11901d3765b4)
- [集成支付宝支付插件](https://github.com/fzlee/alipay/blob/master/README.zh-hans.md)
- django通过数据库反向生成model类的命令  `python manage.py inspectdb`

