from django.core.files.storage import FileSystemStorage


class DFFileSystemStorage(FileSystemStorage):
    def url(self, name):
        return "http://127.0.0.1:8000/media/" + name