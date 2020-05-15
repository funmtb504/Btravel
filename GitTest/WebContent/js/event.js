	$(document).ready(function() {
		
		
		$('#btn').click(function() {
			
				$.ajax({
					url: 'event/lotto.jsp',
					dataType: 'html',
					type: 'get',
					success: function(rdata) {
														
						if(rdata.indexOf("당첨")!=-1) {
							$('.p1').html("<img src='http://1.bp.blogspot.com/-HjVB3SbsLXk/VlowxvdkctI/AAAAAAAARqA/Fh7P3WbWcHM/s1600/congratulations.png' class='img'><br>"+rdata);	
						}else if(rdata.indexOf("꽝")!=-1) {
							$('.p1').html("<img src='images/x.PNG' class='img'><br>"+rdata);
						}else if(rdata.indexOf("종료")!=-1){
							$('.p1').html("<img src='images/a.png' class='img'><br>"+rdata);
							$("#btn").css('opacity','0').css('pointer-events','none');
							return false;
						}	
						
						$("#btn").css('opacity','0').css('pointer-events','none');
					
						
						setTimeout(function() {
							
							$(".p1").html("<img src='images/box.png' id='img'><br>");
							$("#btn").css('opacity','1').css('pointer-events','auto');
							
							}, 4000);
					},
					error: function() {
						alert("실패");				

					}
				});
		});
		$('#btn').mouseover(function() {
			
			$('#img').css('-webkit-animation','vibrate-1 0.3s linear infinite both').css('animation','vibrate-1 0.3s linear infinite both')
		});
		$('#btn').mouseout(function() {
			
			$('#img').css('-webkit-animation','').css('animation','');
		});
		
		
		function abc(){
			
			var addDate = document.getElementById("hid").value;
			
			var ts = new Date(addDate);

	    	
	    	$('#countdown').empty();
	    	
	    	$('#countdown').countdown({
	    		timestamp	: ts,
	    		callback	: function(days, hours, minutes, seconds){
	    		}
	    	});
	    };
	    
	    abc();
		
		
	});
	
	

    
    
	