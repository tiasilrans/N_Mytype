<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Input Array</title>
<script src="https://code.jquery.com/jquery-1.7.2.js"></script>
<script type="text/javascript">
 
    $(document).ready(function(){
       
 
      // 체크박스 배열 Loop
      $("input[name=chk]").each(function(idx){   
         
        // 해당 체크박스의 Value 가져오기
        var value = $(this).val();
 
        var eqValue = $("input[name=chk]:eq(" + idx + ")").val() ;
         
        console.log(value + ":" + eqValue) ;
         
      });
       
       
      // 배열의 특정순서의 Value 가져오기
      var orange = $("input[name=chk]:eq(2)").val() ;
      console.log(orange);
       
 
       
      // 배열의 특정순서 Value 변경하기
      $("input[name=chk]:eq(2)").val("포도") ;
       
      var chgFruit = $("input[name=chk]:eq(2)").val() ;
      console.log(chgFruit) ;
       
    });
 
</script>
</head>
<body>
    <input type="checkbox" name="chk" id="chk" value="바나나">바나나
    <input type="checkbox" name="chk" id="chk" value="딸기">딸기
    <input type="checkbox" name="chk" id="chk" value="오렌지">오렌지
</body>
</html>


