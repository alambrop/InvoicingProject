<!DOCTYPE html>
<html>
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 <script>
$(document).ready(function() {
      $('#creditcard').click(function() {
          $('#checkForm').slideUp("slow", function() {
            $('#saveForm').slideUp("slow", function() {
              $('#cardform').slideToggle();
          });
        });
      });
      $('#checkAccount').click(function() {
          $('#cardform').slideUp("slow", function() {
            $('#saveForm').slideUp("slow", function() {
              $('#checkForm').slideToggle();
          });
        });
      });
      $('#saveAccount').click(function() {
          $('#checkForm').slideUp("slow", function() {
            $('#cardform').slideUp("slow", function() {
              $('#saveForm').slideToggle();
          });
        });
      });
    });
 </script>

 <script type="text/javascript">

          function isNumberKey(evt)
          {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

             return true;
          }

 </script>

 <head>
   <title>Make A Payment - Invoice <%=request.getAttribute("code") %></title>
    <link href="https://fonts.googleapis.com/css?family=Raleway" type="text/css" rel="stylesheet" >
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" type="text/css" rel="stylesheet" >
 </head>

 <body>
  <h1>
    <div id="header">AIG</div>
    <div id="inv_num">Invoice: <%=request.getAttribute("code") %></div>
  </h1>

   <p class="policy">Policy Number - <%=request.getAttribute("policyID") %></p>

   <h2>Payment Amount</h2>

   <h3>$<%=request.getAttribute("paymentDue") %></h3>

   <h4>Payment Due Date is <%=request.getAttribute("paymentDueDate") %></h4>

   <p>Select A Payment Method:</p>

   <ul>
     <button class="button buttons" id="creditcard">Credit Card </button>
     <button class="button buttons" id="checkAccount">Checking</button>
     <button class="button buttons" id="saveAccount">Savings</button>
   
   </ul>
  <br>
  <form id="cardform" >
    <hr>
    <p class="formTitle"> Card Information </p>
    <label class="floatLabel creditCard">Credit Card Number</label>
    <input type="text" class="creditForm" name="CCN" maxlength="16">
    <br>
    <label class="floatLabel expDate">Expiration Date (MMYY)</label>
    <input type="text" class="creditForm" name="CCN" maxlength="4">
    <br>
    <label class="floatLabel securityCode">Security Code</label>
    <input type="text" class="creditForm" name="cvv"  maxlength="3">
    <br>
    <br>
    <hr>
    <p class="formTitle"> Card Holder Information </p>
    <br>
    <label class="floatLabel firstName">First Name</label>
    <input type="text" class="creditForm" name="fName">
    <br>
    <label class="floatLabel lastName">Last Name</label>
    <input type="text" class="creditForm" name="lName">
    <br>
    <label class="floatLabel streetAddress">Street Address</label>
    <input type="text" class="creditForm" name="Address1">
    <br>
    <label class="floatLabel aptSuite">Apt/Suite (optional)</label>
    <input type="text" class="creditForm" name="Address2">
    <br>
    <label class="floatLabel cityName">City Name</label>
    <input type="text" class="creditForm" name="city">
    <br>
    <label class="floatLabel selectSate">Select State</label>
    <select type="text" class="creditForm" name="state">
        <option></option>
        <option value="AL">Alabama</option>
        <option value="AK">Alaska</option>
        <option value="AZ">Arizona</option>
        <option value="AR">Arkansas</option>
        <option value="CA">California</option>
        <option value="CO">Colorado</option>
        <option value="CT">Connecticut</option>
        <option value="DE">Delaware</option>
        <option value="DC">District Of Columbia</option>
        <option value="FL">Florida</option>
        <option value="GA">Georgia</option>
        <option value="HI">Hawaii</option>
        <option value="ID">Idaho</option>
        <option value="IL">Illinois</option>
        <option value="IN">Indiana</option>
        <option value="IA">Iowa</option>
        <option value="KS">Kansas</option>
        <option value="KY">Kentucky</option>
        <option value="LA">Louisiana</option>
        <option value="ME">Maine</option>
        <option value="MD">Maryland</option>
        <option value="MA">Massachusetts</option>
        <option value="MI">Michigan</option>
        <option value="MN">Minnesota</option>
        <option value="MS">Mississippi</option>
        <option value="MO">Missouri</option>
        <option value="MT">Montana</option>
        <option value="NE">Nebraska</option>
        <option value="NV">Nevada</option>
        <option value="NH">New Hampshire</option>
        <option value="NJ">New Jersey</option>
        <option value="NM">New Mexico</option>
        <option value="NY">New York</option>
        <option value="NC">North Carolina</option>
        <option value="ND">North Dakota</option>
        <option value="OH">Ohio</option>
        <option value="OK">Oklahoma</option>
        <option value="OR">Oregon</option>
        <option value="PA">Pennsylvania</option>
        <option value="RI">Rhode Island</option>
        <option value="SC">South Carolina</option>
        <option value="SD">South Dakota</option>
        <option value="TN">Tennessee</option>
        <option value="TX">Texas</option>
        <option value="UT">Utah</option>
        <option value="VT">Vermont</option>
        <option value="VA">Virginia</option>
        <option value="WA">Washington</option>
        <option value="WV">West Virginia</option>
        <option value="WI">Wisconsin</option>
        <option value="WY">Wyoming</option>
    </select>
    <br>
    <label class="floatLabel zipCode">Zip Code</label>
    <input type="text" class="creditForm" name="zip" maxlength="5">
    <br>
  </form>

  <form id="checkForm">
    <hr>
    <p class="formTitle"> Checking Account Information </p>
    <label class="floatLabel nickname">Account Nickname</label>
    <input type="text" class="checkInput" name="nickname" maxlength="25">
    <br>
    <label class="floatLabel routing">Routing Number</label>
    <input type="text" class="checkInput" onkeypress="return isNumberKey(event)" name="routing" maxlength="9">
    <br>
    <label class="floatLabel account">Bank Account Number</label>
    <input type="text" class="checkInput" onkeypress="return isNumberKey(event)" name="accnt" maxlength="12">
    <br>
    <label class="floatLabel bankName">Financial Institution Name</label>
    <input type="text" class="checkInput" name="checkName" maxlength="25">
    <br>
    
    <form class="checkbox">
      <p> <input type="checkbox" name="recurring" value="recurring"> Opt In for Recurring Payments</p>
    </form>
    <br>
  </form>
   <form id="saveForm" >
    <hr>
    <p class="formTitle"> Savings Account Information </p>
    <label class="floatLabel nickname">Account Nickname</label>
    <input type="text" class="saveInput" name="nickname">
    <br>
    <label class="floatLabel routing">Routing Number</label>
    <input type="text" class="saveInput" onkeypress="return isNumberKey(event)" name="routing" maxlength="9">
    <br>
    <label class="floatLabel account">Bank Account Number</label>
    <input type="text" class="saveInput" onkeypress="return isNumberKey(event)" name="accnt" maxlength="12">
    <br>
    <label class="floatLabel bankName">Financial Institution Name</label>
    <input type="text" class="saveInput" name="saveName"><br>

    <form class="checkbox">
      <p> <input type="checkbox" name="recurring" value="recurring"> Opt In for Recurring Payments<br></p>
    </form>
  </form>
  <br>


  <p>Select A Payment Date:</p>
  <form id="dtpcker">
      <input type="text" id="dateBox" placeholder="MM/DD/YYYY">
      <!--<input type="button" id="datepicker" placeholder="mm/dd/yyyy">-->
  </form>
  <br>
 <!-- <form class="checkbox">
    <input type="checkbox" name="recurring" value="recurring"> Opt In for Recurring Payments<br>
  </form>-->
  <form id="SubPayment" action="SubmitPaymentt" method="post" >
  <input type="hidden" name="firstName" value=<%=request.getAttribute("firstName") %> >
  <input type="hidden" name="lastName" value=<%=request.getAttribute("lastName") %> >
  <input type="hidden" name="code" value=<%=request.getAttribute("code") %> >
   <input type="submit" class="button buttons" value="Submit">
   </form>
 </body>
</html>

<style>
  body {
    padding: 5px;
    margin: auto;
    width: 65%;
    border: 2px solid dimgray;
    border-radius: 4px;
    text-align: center;
    overflow-y: scroll;
  }

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

  /* Payment Amount */
  h2 {
      color: rgb(84, 86, 91);
      margin-bottom: 5px;
      font-size: 30px;
      line-height: 25px;
  }

  /* Bill Amount */
  h3 {
      color: rgb(0,164,228);
      font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
      font-size: 85px;
      line-height: 25px;
  }

  /* Payment Due Date */
  h4 {
      color: rgba(196, 18, 48, 0.9);
      line-height: 20px;
  }

  h2, h4, p, .button, .checkbox {
      font-family: "Raleway";
  }

  .checkbox {
    height: 50px;
    width: 50px;
  }

  li {
      display: inline-block;
  }
  ul {
    position: relative;
    right: 15px;

  }

  .button {
      border: none;
      border-radius: 4px;
      color: white;
      padding: 10px 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      font-weight: bold;
      margin: 4px 25px;
      cursor: pointer;
      transition-duration: 0.4s;
  }

  .buttons {
      border: 2px solid rgb(118, 119, 123);
      color: rgb(84, 86, 91);
      background-color: white;
      width: 155px;
  }

  #creditcard, #checkAccount, #saveAccount {
      height: 80px;
      width: 185px;
      font-size: 22px;
  }

  .buttons:hover {
      background-color:rgb(118, 119, 123); 
      color: white; 
  }

  #checkForm, #cardform, #saveForm {
      display: none;
  }

  .formTitle {
    text-align: left;
    margin-left: 5%;
  }

  hr {
    width: 90%;
    color: lightgray;
  }

  .creditForm, .checkInput, .saveInput{
    height: 40px;
    width: 90%;
    margin: 10px;
  }

  .floatLabel {
    display: inline-block;
    position: relative;
    color: black;
    font-size: 75%;
    top: 21px; 
    background-color: white;
    padding: 5px;
    font-family: 'Raleway';
  }

  /*Label Alignment*/
  .nickname {
    margin-right: 637px;
  }

  .routing {  
    margin-right: 651px;
  }

  .account {
    margin-right: 616px;

  }

  .bankName {
    margin-right: 600px;

  }

  .creditCard {
    margin-right: 630px;
  }

  .expDate {
    margin-right: 612px;
  }

  .securityCode {
    margin-right: 668px;
  }

  .firstName {
    margin-right: 682px;
  }

  .lastName {
    margin-right: 682px;
  }

  .streetAddress {
    margin-right: 662px;
  }

  .aptSuite {
    margin-right: 635px;
  }

  .cityName {
    margin-right: 683px;
  }

  .selectSate {
    margin-right: 671px;
  }

  .zipCode {
    margin-right: 692px;
  }


  #checkForm input, #cardform input, #saveForm input {
      text-align: left;
    /* margin: 4px 0px;*/
  }

  #checkForm input:focus, #cardform input:focus, #dtpcker input:focus, textarea:focus, #saveForm input:focus {
      box-shadow: 0 0 5px rgba(81, 203, 238, 1);
      border: 2px solid rgba(81, 203, 238, 1);
  }

  #dtpcker input {
      text-align: center;
  }
  #dateBox {
      position: relative;
      bottom: 13px;
      right: 4px;
  }

</style>