<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>AIG Invoice <%= request.getAttribute("code") %></title>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="main.css">

</head>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

<script>
 /* $(document).ready(function() {
    $('input[type=button]').click(function(){
      var lenSsn1 = $('#SSN1').val().length;
      var lenSsn2 = $('#SSN2').val().length;
      var lenSsn3 = $('#SSN3').val().length;
      if (lenSsn1 != 3){
        alert('Enter Valid Social Security Number');
      }
      else if (lenSsn2 != 2) {
        alert('Enter Valid Social Security Number');
      }
      else if (lenSsn3 != 4) {
        alert('Enter Valid Social Security Number');
      }
      else {
        window.location="payment.jsp";
      }
    });
  });*/
</script>
<script>
  function autotab(current,to)
  {
      if (current.getAttribute && current.value.length==current.getAttribute("maxlength"))
      {
        to.focus()
      }
  }
</script>
<style>
  h1{
    margin: auto;
    background-color: rgb(0,164,228);
    border-radius: 5px;
    width: 475px;
    height: 75px;
    align: center;
    padding: 10px;
  }
  div[id=header]{
    display: inline-block;
    font-family: "Arial";
    text-align: left;
    font-size: 50px;
    color: white;
    float: left;
    padding: 4px;
    border-style: solid;
    border-width: 5px;
  }
  div[id=inv_num]{
    display: inline-block;
    font-family: "Arial";
    padding: 10px;
    font-size: 20px;
    color: rgb(242,242,242);
    float: right;
  }
  body {
    margin: auto;
    border-style: solid;
    border-radius: 4px;
    width: 500px;
    border-width: 2px;
    border-color: rgb(133,133,133);
    padding: 5px;
  }
  div[id=name]{
    font-family: "Arial";
    padding: 5px;
    font-size: 40px;
    color: rgb(51,51,51);
    text-align: center;
  }
  div[id=greet]{
    font-family: "Arial";
    text-align: center;
    color: rgb(51,51,51);
  }
  form {
    font-family: "Arial";
    text-align: center;
  }
  input[type=password]{
    font-family: "Arial";
    text-align: center;
    border: 1px solid;
    border-radius: 4px;
    color: rgb(133,133,133);
  }
  input[type=password]:focus, textarea:focus {
    box-shadow: 0 0 5px rgba(81, 203, 238, 1);
    border: 2px solid rgba(81, 203, 238, 1);
  }
  input[type=submit]{
    background-color: white;
    border: 2px solid rgb(118,119,123);
    color: rgb(84,86,91);
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
    transition-duration: 0.4s;
  }

  .submit:hover{
    background-color: rgb(118,119,123);
    color: white;
  }
  p{
    text-align: center;
    font-family: "Arial";
    font-size: 10pt;
  }
</style>
<body>
  <h1>

    <div id="header">AIG</div>
    <div id="inv_num">Invoice: <%= request.getAttribute("code") %></div>


  </h1>
  <br>
  <br>
  <div id="name">Welcome <%= request.getAttribute("firstName") %> <%= request.getAttribute("lastName") %></div>
  <br>
  <br>
  <div id="greet">Verify Your Social Security Number Below:</div>
  <br>
  <br>
  <form name="ssn" action = "mainServlet" method = "post">
    <input type="password" name="SSN1" placeholder="xxx" size="3" maxlength="3" autofocus oninput="autotab(this, document.ssn.SSN2)"> -
    <input type="password" name="SSN2" placeholder="xx" size="2" maxlength="2" oninput="autotab(this, document.ssn.SSN3)"> -
    <input type="password" name="SSN3" placeholder="xxxx" size="4" maxlength="4" oninput="autotab(this, document.ssn.viewBill)"><br>
    <br>
    <br>
    <input type="submit" name="viewBill" value="View Bill">
  </form>
  <br>
  <br>
<p>
  Not you? <a href="NotMe.html">Click Here</a>
</p>
</body>
</html>
