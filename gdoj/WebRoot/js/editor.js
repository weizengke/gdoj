$(document).ready(function(){
    var editor = Array();
    KindEditor.ready(function (K) {
        var textareaArray = K.queryAll('textarea[class=ke-editor]');
        var index = 0;
        for(var i=0; i < textareaArray.length; i++) {
            if (textareaArray[i].id) {
                editor[i] = K.create('#' + textareaArray[i].id, {
                    resizeType : 1,
                    pasteType : 1,
                    allowUpload : true,
                    syncType : 'auto',
                    themeType : 'default',
                    items : [ 'bold', 'italic', 'underline', 'strikethrough', 'removeformat','|','forecolor', 'hilitecolor',
                        'title', 'fontname', 'fontsize',  '|',
                        'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|',
                        'link', 'unlink', 'code', 'image', 'quote', '|', 'source' , 'preview', 'about'
                    ],
                    afterBlur: function(){this.sync();},
                    afterCreate: function () {
                        var editor_ = this;
                        var editerDoc = this.edit.doc;
                        editerDoc.addEventListener('paste', function (event) {
                            var items = event.clipboardData.items;
                            if (items && (items[0].type.indexOf('image') > -1)) {
                                var file = items[0].getAsFile();
                                var newImg = new Date().getTime() + '.png';
                                var formData = new FormData();
                                formData.append('file', file, newImg)
                                $.ajax({
                                    type: "POST",
                                    url: "uploadImage",
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    success: function (data) {
                                        var data = data;
                                        var src = data.filePath;
                                        var imgTag = "<img src='"+ src +"' border='0'/>";
                                        editor_.insertHtml(imgTag);
                                    },
                                    error: function (data) {
                                        console.log("error.. " + data.error);
                                    }
                                })
                            }
                        })
                    }
                });
            }
        }
    });
});