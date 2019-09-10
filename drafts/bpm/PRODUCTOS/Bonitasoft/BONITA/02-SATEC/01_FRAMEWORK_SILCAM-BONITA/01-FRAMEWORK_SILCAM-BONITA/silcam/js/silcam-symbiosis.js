		$(document).ready(function(){
			
			$('input').iCheck({
				checkboxClass: 'icheckbox_flat-grey',
				radioClass: 'iradio_flat-grey'
			});
			
			$('.js-datepicker').datetimepicker({
			    pickTime: false
			});
			
			tinymce.init({
				selector: "textarea#area-desc",
				theme: "modern",
				skin: 'light',
				plugins: "link paste",
				statusbar : false,
				menubar: false,
				height:250,
				content_css : "css/custom_tinycme.css",
				toolbar: [
				    "undo redo | bold italic | link image | alignleft aligncenter alignright | bullist | numlist"
				]
			});
			
			
			$("a").on("click", function(e) {
				//alert("click");
				e.preventDefault();
			});
		
			$(".fake-upload").on("click", function(e) {
				e.preventDefault();
				var inputf = $(this).attr("data-file");
				$("#"+inputf+"").trigger("click")
			});
			
			$(".custom-file").on("change", function(e) {
				e.preventDefault();
				if($(this).val()!=""){
					var btnfile = $(this).attr("id");
					$("a[data-file='"+btnfile+"']").addClass("a-ac-upload-ok");
				}
				
			});
		});