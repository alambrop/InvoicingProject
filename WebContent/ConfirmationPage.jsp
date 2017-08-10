<!DOCTYPE html>
<html>
<head>
  <title>AIG Invoice <%=request.getAttribute("code") %></title>
  <meta charset="utf-8"/>
  <link href="https://fonts.googleapis.com/css?family=Raleway" type="text/css" rel="stylesheet" >
</head>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

<script>
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
  /* AIG & Invoice# */
  h1 {
    margin: auto;
    background-color: rgb(0,164,228);
    border-radius: 5px;
    width: 97%;
    height: 75px;
    text-align: center;
    padding: 10px;
  }

  /* AIG Header */
  div[id=header]{
    display: block;
    font-family: "Arial";
    font-weight: bold;
    text-align: left;
    font-size: 50px;
    color: white;
    float: left;
    padding: 4px;
    border-style: solid;
    border-width: 3px;
  }

  /* Invoice# */
  div[id=inv_num]{
    display: block;
    font-family: "Arial";
    padding: 10px;
    font-size: 20px;
    color: white;
    float: right;
  }
  body {
    margin: auto;
    border: 2px solid rgb(133,133,133);
    border-radius: 4px;
    width: 65%;
    padding: 5px;
    font-family: "Raleway";
  }
  div[id=name]{
    font-family: "Raleway";
    padding: 5px;
    font-size: 40px;
    color: rgb(51,51,51);
    text-align: center;
  }
  div[id=greet]{
    font-family: "Raleway";
    text-align: center;
    color: rgb(51,51,51);
  }
  form {
    font-family: "Raleway";
    text-align: center;
  }
  input[type=password]{
    font-family: "Raleway";
    font-size: 18px;
    text-align: center;
    border: 1px solid;
    border-radius: 4px;
    color: rgb(133,133,133);
  }
  input[type=password]:focus, textarea:focus {
    box-shadow: 0 0 5px rgba(81, 203, 238, 1);
    border: 2px solid rgba(81, 203, 238, 1);
  }
  input[type=button]{
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
    font-family: "Raleway";
  }

  .button:hover{
    background-color: rgb(118,119,123);
    color: white;
  }
  p {
    text-align: center;
    font-family: "Raleway";
    font-size: 10pt;
  }
</style>
<body>
  <h1>
    <div id="header">AIG</div>
    <div id="inv_num">Invoice: <%=request.getAttribute("code") %></div>
  </h1>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div id="name">Thank you for your payment, <%=request.getAttribute("firstName") %> <%=request.getAttribute("lastName") %>!</div>
  <br>
  <br>


  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

</body>
</html>
