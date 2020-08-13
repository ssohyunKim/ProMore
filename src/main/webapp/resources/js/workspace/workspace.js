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

              $("#btn").click(function(){
                     $("#resultDate").text($("#date1").val());
              });
              $("#btn").click(function(){
                  $("#resultDate").text($("#date2").val());
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
    
    
       var root = null;
       function writeToServer(requestRoot){
          /*$("#workRead").css("display","block");
          $("#alarm").css("display","block");
           $('.toast').toast('show');
           */
           
           var root = requestRoot;
      
           var workSender = $("#workSender").text();
           var workStateVar = $('input[name="workState"]:checked').val();
              if(workStateVar=="요청"){
                 var workState="0";
              }
              if(workStateVar=="진행"){
                 var workState="1";
              }
              if(workStateVar=="완료"){
                 var workState="2";
              }
           var workReceiver = $("#workReceiver").text();
           var workStartDate = $(".calenderStart").val();
           var workEndDate = $(".calenderEnd").val();
           var workSubject = $(".workSubject").val();
           var workContent = $(".workContent").val();
           
           var url = root+"/workspace/workspace.do";
           var params ="?workSender="+workSender+"&workState="+workState+"&workReceiver="+workReceiver
                       +"&workStartDate="+workStartDate+"&workEndDate="+workEndDate+"&workSubject="+workSubject
                       +"&workContent="+workContent;
                       
          	
          	
           var url = url + params;
           
           
        
          $.ajax({
           	url: url,
           	type:"get",
           	dataType:"text",
           	success:writeProcess(data),
           	error: failProcess()
           }); 
         
           
           
           var workTest = document.getElementById("work-test");
           var copyWorkTest = workTest.cloneNode(true);
           copyWorkTest.style.display = "block";
           
           var workRead = document.getElementById("workRead");
           
           $("#workRead").after($(copyWorkTest));
           return false;
       }
       
       function writeProcess(data){
       	alert('확인');
       }
       
       function failProcess(){
       	alert('실패');
       	}
       
       
     

  