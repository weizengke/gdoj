$(document).ready(function(){
	$("a.photo").click(function() {				
		var scrollTop = window.pageYOffset||document.documentElement.scrollTop || document.body.scrollTop;
		var topPosInner = 60 + scrollTop;
		var leftPosIner = ($(document.body).width() - 672)/2;
	    document.getElementById('pop-inner-div-photo').style.top= topPosInner +'px';
	    document.getElementById('pop-inner-div-photo').style.left= leftPosIner +'px';
		document.getElementById('pop-div-photo').style.top= scrollTop +'px';
		document.documentElement.style.overflowY = 'hidden';

		$(".pop-div-photo").fadeIn(); 
		$(".pop-inner-div-photo").fadeIn(); 
		return false;
	});
	$(".pop-div-photo").click(function(){
		$(".pop-div-photo").fadeOut(); 
		$(".pop-inner-div-photo").fadeOut(); 
		document.documentElement.style.overflowY = 'scroll';
	});
	
	function getSize(size){
		var num=parseInt(size);
		if(num<=300){
			return num;
		}
		return getSize(num/2);
	}
	
	function getRoundedCanvas(sourceCanvas) {
		var canvas = document.createElement('canvas');
		var context = canvas.getContext('2d');
		var width = sourceCanvas.width;
		var height = sourceCanvas.height;
		width=getSize(width);
		height=width;
		canvas.width = width;
		canvas.height = height;
		context.beginPath();
		context.arc(width/2, height/2, Math.min(width, height)/2, 0, 2 * Math.PI);
		context.strokeStyle = 'rgba(0,0,0,0)';
		context.stroke();
		context.clip();
		context.drawImage(sourceCanvas, 0, 0, width, height);
		return canvas;
	}

	var image = document.getElementById('img-photo');
	var cropper, canvas;
	$('#file').change(function(e) {
	    if (cropper) {
	        cropper.destroy();
	    }
	    var file;
	    var files = e.target.files;
	    if (files && files.length > 0) {
	        file = URL.createObjectURL(files[0]);
	        $('#img-photo').attr({ 'src': file })
	    }
	    cropper = new Cropper(image, {
	        aspectRatio: 1,
	        viewMode: 1,
	        background: true, //是否显示网格背景
	        zoomable: true,   //是否允许放大图像
	        guides: true,     //是否显示裁剪框虚线
	        crop: function(event) { //剪裁框发生变化执行的函数。
	            canvas = cropper.getCroppedCanvas({
	                minWidth: 200,
				    minHeight: 200,
					maxWidth: 400,
					maxHeight: 400,
	                imageSmoothingEnabled: true,
	  				imageSmoothingQuality: 'high',
	            });
	            
	            roundedCanvas = getRoundedCanvas(canvas);
	            $('#imga-preview').attr("src", roundedCanvas.toDataURL("image/png", 1))
	            $('#imga-preview80').attr("src", roundedCanvas.toDataURL("image/png", 1))
	            $('#imga-preview50').attr("src", roundedCanvas.toDataURL("image/png", 1))
	        }
	    });
	})

	$('button.btn-avatar-upload').click(function() {
	    var file = dataURLtoBlob($('#imga-preview').attr("src"));
	    var newImg = new Date().getTime() + '.png';
	    var formData = new FormData();
	    formData.append('titlePhoto', file, newImg)
		$.ajax({
	        type: "POST",
	        url: "uploadphoto",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(data) {
	            var data = data;
	            window.location.reload();
	        },
	        error: function (data) {
	        	alert("upload failed.");
			}
	    })
	})

	function dataURLtoBlob(dataurl) {
	    var arr = dataurl.split(','),
	        mime = arr[0].match(/:(.*?);/)[1],
	        bstr = atob(arr[1]),
	        n = bstr.length,
	        u8arr = new Uint8Array(n);
	    while (n--) {
	        u8arr[n] = bstr.charCodeAt(n);
	    }
	    return new Blob([u8arr], { type: mime });
	}	
});