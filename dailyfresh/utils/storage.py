from django.core.files.storage import Storage
from django.conf import settings


class FdfsStorage(Storage):
    def __init__(self, client_conf=None, base_url=None):
        """初始化"""
        if client_conf is None:
            client_conf = settings.FDFS_CLIENT_CONF
        self.client_conf = client_conf

        if base_url is None:
            base_url = settings.FDFS_URL
        self.base_url = base_url

    def open(self, name, mode='rb'):
        pass

    def save(self, name, content, max_length=None):
        """保存文件时使用"""
        # name:你选择上传文件的名字
        # content:包含你上传文件内容的File对象
        # 创建一个Fdfs_client对象

    def exists(self, name):
        return False