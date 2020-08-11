  $(function(){
             $( "#date1" ).datepicker({
                       dateFormat: "yy-mm-dd",
                       monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                       dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
                       changeMonth: true,
                       changeYear: true,
                       currentText: "Today",
                       showOtherMonths: true,
                       yearRange: "2010:2020"
                      
                     });
              $( "#date2" ).datepicker({
                  dateFormat: "yy-mm-dd",
                  monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                  dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
                  changeMonth: true,
                  changeYear: true,
                  currentText: "Today",
                  showOtherMonths: true,
                  yearRange: "2010:2020"
                     });
                          $( "#date3" ).datepicker({
                       dateFormat: "yy-mm-dd",
                       monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                       dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
                       changeMonth: true,
                       changeYear: true,
                       currentText: "Today",
                       showOtherMonths: true,
                       yearRange: "2010:2020"
                      
                     });
              $( "#date4" ).datepicker({
                  dateFormat: "yy-mm-dd",
                  monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                  dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
                  changeMonth: true,
                  changeYear: true,
                  currentText: "Today",
                  showOtherMonths: true,
                  yearRange: "2010:2020"
                     });
              $("#btn").click(function(){
                     $("#resultDate").text($("#date1").val());
              });
              $("#btn").click(function(){
                  $("#resultDate").text($("#date2").val());
           });
              
                    
              $("#secondUl li:first-child").click(function(){
             	 // alert("확인");
             	 $("#secondUl li:first-child").css("color","white"); 
             	 $("#secondUl li:first-child").css("background","#6799FF"); 
             	 $("#secondUl li:nth-child(2)").css("color","black"); 
             	 $("#secondUl li:nth-child(2)").css("background","white");
             	 $("#secondUl li:nth-child(3)").css("color","black"); 
              	 $("#secondUl li:nth-child(3)").css("background","white"); 
               });              
              $("#secondUl li:nth-child(2)").click(function(){
            	 // alert("확인");
            	 $("#secondUl li:first-child").css("color","black"); 
            	 $("#secondUl li:first-child").css("background","white"); 
            	 $("#secondUl li:nth-child(2)").css("color","white"); 
            	 $("#secondUl li:nth-child(2)").css("background","#6f42c1");
            	 $("#secondUl li:nth-child(3)").css("color","black"); 
             	 $("#secondUl li:nth-child(3)").css("background","white"); 
              });
              $("#secondUl li:nth-child(3)").click(function(){
             	  //alert("확인");
             	 $("#secondUl li:first-child").css("color","black"); 
             	 $("#secondUl li:first-child").css("background","white");
             	 $("#secondUl li:nth-child(2)").css("color","black"); 
             	 $("#secondUl li:nth-child(2)").css("background","white"); 
             	 $("#secondUl li:nth-child(3)").css("color","white"); 
             	 $("#secondUl li:nth-child(3)").css("background","#858796"); 
               });
              
              $(".addIndex").click(function(){
            	 //alert("확인");
            	 $(".addIndexDiv").css("display","block");
            	 $(".addIndex").css("display","none");
            	
              });
              
                $("#manager").children("a").eq(0).click(function(){
              	//alert("왕아아아");
              	var test = $("#manager").children("a").eq(0).text();
              	//alert(test);
              	$("#managerWho").html(test);
              });
              
              $("#manager").children("a").eq(1).click(function(){
              	//alert("왕아아아");
              	var test = $("#manager").children("a").eq(1).text();
              	$("#managerWho").html(test);
              });
              $("#manager").children("a").eq(2).click(function(){
              	//alert("왕아아아");
              	var test = $("#manager").children("a").eq(2).text();
              	//alert(test);
              	$("#managerWho").html(test);
              });
              
             
       });
       
       function managerSelect(root){
     	  //alert("확인"+root);
     	  var url = root +"/workspace/manager.do";
     	  alert(url);
          window.open(url,"","width=300px, height=200px");
           //"주소","윈도우이름","가로세로스크롤"
    }
       function workPost(){
    	   $("#workRead").css("display","block");
    	   $("#alarm").css("display","block");
    	    $('.toast').toast('show');
       }
       
       

  