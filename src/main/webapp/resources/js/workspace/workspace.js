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
              
                    
            /*  $(".secondUl").click(function(){
                 //alert("확인");
                 $(".workState input:first-child").css("color","white"); 
                 $(".workState input:first-child").css("background","#6799FF"); 
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
               
               */
              
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
          /*$("#workRead").css("display","block");
          $("#alarm").css("display","block");
           $('.toast').toast('show');
           */
           
           var workRead = document.getElementById("workRead");
           
            var workReadDiv = document.createElement("div");
            workReadDiv.className="card";
            workReadDiv.className+=" shadow";
            workReadDiv.className+=" mb-4";
            workReadDiv.className+=" border-bottom-primary";
           
            var cardBodyDiv = document.createElement("div");
             cardBodyDiv.className = "card-body";
             
             var form = document.createElement("form");   
             form.setAttribute("action","#");
			 form.setAttribute("method","get");             
             form.setAttribute("onsubmit","workPost()");
             
             var hiddendDiv = document.createElement("div");
             hiddendDiv.className="o-hidden"; 
             
             var writeStateDiv = document.createElement("div");
             writeStateDiv.className = "form-check-inline";
             writeStateDiv.className += " col";
             writeStateDiv.className += " justify-content-between";
             writeStateDiv.className += " pb-4";
             
             var b = document.createElement("b");
             b.innerHTML="작성자";
             
             var stateDiv = document.createElement("div");
             stateDiv.className = "btn-group";
             stateDiv.className += " btn-group-toggle";
             stateDiv.className += " my-1";
             stateDiv.className += " workState";
             stateDiv.setAttribute("data-toggle","buttons");
             
             var inputRadio1 = document.createElement("input");
             inputRadio1.setAttribute("type","radio");
             inputRadio1.setAttribute("name","options");
             inputRadio1.id="option1";
             inputRadio1.setAttribute("check","true");
             
             var label1 = document.createElement("label");
             label1.className = "btn";
             label1.className += " btn-primary";
             label1.className += " active";
             label1.appendChild(inputRadio1);
             label1.innerHTML="요청"
             
              var inputRadio2 = document.createElement("input");
             inputRadio2.setAttribute("type","radio");
             inputRadio2.setAttribute("name","options");
             inputRadio2.id="option2";
            
             var label2 = document.createElement("label");
             label2.className = "btn";
             label2.className += " btn-success";
             label2.appendChild(inputRadio2);
             label2.innerHTML="진행"
              
               var inputRadio3 = document.createElement("input");
             inputRadio3.setAttribute("type","radio");
             inputRadio3.setAttribute("name","options");
             inputRadio3.id="option3";
             
             var label3 = document.createElement("label");
             label3.className = "btn";
             label3.className += " btn-secondary";
             label3.appendChild(inputRadio3);
             label3.innerHTML="완료"
             
               var datePickerDiv = document.createElement("div");
               datePickerDiv.className = "form-check-inline";
               datePickerDiv.className += " col";
               datePickerDiv.className += " justify-content-between";
               datePickerDiv.className += " pb-4";
               
               var managerDiv = document.createElement("div");
                               
             var managerA = document.createElement("a");
             managerA.innerHTML="이형은";
             
             var managerAA = document.createElement("a");
             managerAA.setAttribute("href","#");
           managerAA.setAttribute("onclick","managerSelect('root')");            
             managerAA.className="text-decoration-none";
             managerAA.className +=" col-sm-3";
             managerAA.innerHTML="담당자 변경";
             
             var datePickerdiv = document.createElement("div");
             datePickerdiv.className = "justify-content-between";
             
             var calStartDiv = document.createElement("div");
             calStartDiv.className = "form-check-inline";
             datePickerdiv.appendChild(calStartDiv);
             
             var startSpan = document.createElement("span");
             startSpan.className = "icon";
             calStartDiv.appendChild(startSpan);
             
             var startI = document.createElement("i");
             startI.className = "fas";
             startI.className += " fa-calendar-alt";
             startI.className += " fa-lg";
             startI.className += " mr-2";
             startSpan.appendChild(startI);
             
             var startInput = document.createElement("input");
             startInput.className ="calenderInput";
             startInput.setAttribute("type","text");
             startInput.id="date3";
             startInput.setAttribute("value","시작일");
             calStartDiv.appendChild(startInput);
             
             var calEndDiv = document.createElement("div");
             calEndDiv.className = "form-check-inline";
             datePickerdiv.appendChild(calEndDiv);
             
             var endSpan = document.createElement("span");
             endSpan.className = "icon";
             calEndDiv.appendChild(endSpan);
             
             var endI = document.createElement("i");
             endI.className = "fas";
             endI.className += " fa-calendar-alt";
             endI.className += " fa-lg";
             endI.className += " mr-2";
             endSpan.appendChild(endI);
             
             var endInput = document.createElement("input");
             endInput.className ="calenderInput";
             endInput.setAttribute("type","text");
             endInput.id="date3";
             endInput.setAttribute("value","마감일");
             calEndDiv.appendChild(endInput);
             
             var subjectDiv = document.createElement("div");
             subjectDiv.className="pb-3";
             
             var subjectInput = document.createElement("input");
             subjectInput.setAttribute("type","text");
             subjectInput.className="form-control";
             subjectInput.setAttribute("placeholder","업무명");
             
             subjectDiv.appendChild(subjectInput);
             
             var contentDiv = document.createElement("div");
             contentDiv.className = "pb-3";
             
             var contentText = document.createElement("textarea");
             contentText.className="form-control";
             contentText.innerHTML="업무내용";
             
             contentDiv.appendChild(contentText);

          var fileDiv = document.createElement("div");
          fileDiv.className="pb-3";
          
          var fileSpan = document.createElement("span");
          fileSpan.className="icon";
          fileDiv.appendChild(fileSpan);
          
          var fileI = document.createElement("i");
          fileI.className="fas";
          fileI.className+=" fa-paperclip";
          fileI.className+=" fa-lg";
          fileSpan.appendChild(fileI);
          
          var fileInput = document.createElement("input");
          fileInput.setAttribute("type","file");
          fileInput.className="mx-2";
          fileInput.id="inputFile";
          fileDiv.appendChild(fileInput);
           
           var updateDeleteDiv = document.createElement("div");
           updateDeleteDiv.className="d-flex";
           updateDeleteDiv.className +=" flex-row-reverse";
          
          var updateA = document.createElement("a");
          updateA.className="m-1";
          updateA.className+=" text-decoration-none";
          updateA.setAttribute("href","#");
          updateA.innerHTML="수정";
          
          updateDeleteDiv.appendChild(updateA);
          
          var deleteA = document.createElement("a");
          deleteA.className="m-1";
          deleteA.className+=" text-decoration-none";
          deleteA.setAttribute("href","#");
          deleteA.innerHTML="삭제";
          
          updateDeleteDiv.appendChild(deleteA);
             
             
             workRead.appendChild(workReadDiv);
             workReadDiv.appendChild(cardBodyDiv);
             cardBodyDiv.appendChild(form);
             form.appendChild(hiddendDiv);
             hiddendDiv.appendChild(writeStateDiv);
             writeStateDiv.appendChild(b);
             writeStateDiv.appendChild(stateDiv);
             stateDiv.appendChild(label1);
             stateDiv.appendChild(label2);
             stateDiv.appendChild(label3);
             hiddendDiv.appendChild(datePickerDiv);
             datePickerDiv.appendChild(managerDiv);
             managerDiv.appendChild(managerA);
             managerDiv.appendChild(managerAA);
             datePickerDiv.appendChild(datePickerdiv);
           hiddendDiv.appendChild(subjectDiv);            
           hiddendDiv.appendChild(contentDiv);            
           hiddendDiv.appendChild(fileDiv);            
           hiddendDiv.appendChild(updateDeleteDiv);            
       }
       
       

  