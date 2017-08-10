<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>  
  <title>Make A Payment - Invoice #####</title>
  <link href="Select Payment Draft.css" type="text/css" rel= "stylesheet" >
  <link href="https://fonts.googleapis.com/css?family=Raleway" type="text/css" rel="stylesheet" >
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" type="text/css" rel="stylesheet" >
  <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>

  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="https://dev.api.aig.com/digital/dpu/widget/v1/dpuinitializer.js" type="text/javascript"></script>
</head>
<script>
    $(document).ready(function() {
    /*  $('#creditcard').click(function() {
          $('#bankform').slideUp("slow", function() {
            $('#cardform').slideToggle();
          });

      });
      $('#bankaccount').click(function() {
          $('#cardform').slideUp("slow", function() {
            $('#bankform').slideToggle();
          });

      });*/
      $('#dateBox').datepicker({
        showOn: 'button',
        buttonImage:'calendarButton3.png',
        buttonImageOnly: true,
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

    function printOnDemoPage(reqValues) {
        var jSONString = JSON.stringify(reqValues, null, 4);
        var formatedJson = jSONString.replace(/,/g, ', <br></br>');
        var request = '<h2>Request Widget</h2>' + formatedJson;
          //  window.document.getElementById('payment-request').innerHTML = request;
        }

        window.inline = function (method_id) {

             try {
               dpuinitializer.charges.createCharge({
                  addressline1: '200 College St',
                  addressline2: 'Floor 13',
                  apikey: 'tRx1otwvBGPm0fmVhKs10ngtNKgu9wmk',
                  city: 'Charlotte',
                  docnumber: '0379' + new Date().getMilliseconds(),
                  emailaddress: 'john.smith@aig.com',
                  firstname: 'John',
                  lastname: 'Smith',
                  paymentdate: '2030-04-12',
                  paymethod: method_id,
                  payoridentifier: '45387123' + new Date().getMilliseconds(),
                  productcode: 'AGL',
                  referenceid: '028103810',
                  state: 'NC',
                  zip4: '2931',
                  zip5: '22032',
                  origin: location.origin
              })

                .then(function (res) {
                    console.log('Success Response : ', res);
                    var jSONString = JSON.stringify(res, null, 4);
                    var formatedJson = jSONString.replace(/,/g, ', <br></br>');
                    var response = '<h2>Widget Response</h2>' + formatedJson;
                  //  window.document.getElementById('payment-response').innerHTML = response;
                    console.log('Confirmation received by calling application: ' + res.dpuTransactionId)

                    return res;
                    /* Your code to persist here */
                }).catch(function (res) {
                    console.log('Error Response :' + res)
                    var jSONString = JSON.stringify(res, null, 4);
                    var formatedJson = jSONString.replace(/,/g, ', <br></br>');
                    var response = '<h2>Widget Response</h2> ' + formatedJson;


                    return res;
                });
               }
                catch (e) {
                  var dpuIntErrorDetails = {
                        'dpuTransactionId': "null",
                        'created': new Date(),
                        'success': false,
                         'error': {
                            'code': 'W001',
                            'message': 'dpuinitializer not loaded'
                        }
                 }
                e = dpuIntErrorDetails;
                var jSONString = JSON.stringify(e, null, 4);
                var formatedJson = jSONString.replace(/,/g, ', <br></br>');
                var response = '<h2>Widget Response</h2> ' + formatedJson;
                window.document.getElementById('payment-response').innerHTML = response;
                jq('#response').modal('show');
                }
        };
        function getFormValues() {
            var form = {};
            var fields = ['addressline1', 'addressline2', 'amount', 'apikey', 'city', 'paymentdate', 'emailaddress', 'docnumber', 'doctype', 'docstatus', 'firstname', 'lastname', 'state', 'transactionid', 'referenceid', 'paymethod', 'paymentdate', 'payoridentifier', 'productcode', 'zip4', 'zip5'];
            fields.forEach(function (key) {
                form[key] = key;
            });
            return form;
        }
</script>


<body>
  <h1>
    <div id="header">AIG</div>
    <div id="inv_num">Invoice:  <%=request.getAttribute("code") %></div>
  </h1>

   <p class="policy">Policy Number -  <%=request.getAttribute("policyID") %></p>

   <h2>Payment Amount</h2>

   <h3>$ <%=request.getAttribute("paymentDue") %></h3>

   <h4>Payment Due Date is  <%=request.getAttribute("paymentDueDate") %>/h4>
   <p>Select A Payment Method:</p>

   <ul>
     <button class="button buttons" id="creditcard" onclick="inline('CREDIT_CARD')">Credit Card </button>
     <button class="button buttons" id="bankaccount" onclick="inline('CHECKING_ACCOUNT')">Checking Account</button>
     <button class="button buttons" id="saveaccount" onclick="inline('SAVINGS_ACCOUNT')">Savings Account</button>
  <!--   <a href="https://www.paypal.com/cgi-bin/webscr" target="_blank"><img src= "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2000px-PayPal.svg.png"
      alt= "PayPal" class="button buttons paypal" /></a>
-->
    </ul>
    <div class="boxwidget">
            <div id="payment-widget"> </div>
             <section id="errors"></section>
    </div>

   <!--
   <form id="cardform" >
    <input type="text" name="Name" size="20" placeholder="Name on Card"><br>
    <input type="text" name="CCN" size="20" maxlength="16" placeholder="Credit Card Number"><br>
    <input type="text" name="expDate" size="7" maxlength="4" placeholder="MMYY">
    <input type="text" name="cvv" size="7" maxlength="3" placeholder="cvv"><br>
    <input type="text" name="Address1" size="20" placeholder="Address 1"><br>
    <input type="text" name="Address2" size="20" placeholder="Address 2"><br>
    <input type="text" name="city" size="20" placeholder="city"><br>
    <input type="text" name="state" size="20" maxlength="2" placeholder="state"><br>
    <input type="text" name="zip" size="20" maxlength="5" placeholder="zip code"><br>
  </form>

  <form id="bankform" >
    <input type="text" name="nickname" size="25" maxlength="25" placeholder="Account Nickname"><br>
    <input type="text" onkeypress="return isNumberKey(event)" name="routing" size="25" maxlength="9" placeholder="Routing Number"><br>
    <input type="text" onkeypress="return isNumberKey(event)" name="routing" size="25" maxlength="9" placeholder="Verify Routing Number"><br>
    <input type="text" onkeypress="return isNumberKey(event)" name="accnt" size="25" maxlength="12" placeholder="Bank Account Number"><br>
    <input type="text" onkeypress="return isNumberKey(event)" name="accnt" size="25" maxlength="12" placeholder="Verify Bank Account Number"><br><br>

    <form class="checkbox">
      <p> <input type="checkbox" name="recurring" value="recurring"> Opt In for Recurring Payments<br></p>
    </form>
  </form>
  <br>
  -->

  <p>Select A Payment Date:</p>
  <form id="dtpcker">
      <input type="text" id="dateBox" placeholder="MM/DD/YYYY">
      <!--<input type="button" id="datepicker" placeholder="mm/dd/yyyy">-->
  </form>
  <br>
 <!-- <form class="checkbox">
    <input type="checkbox" name="recurring" value="recurring"> Opt In for Recurring Payments<br>
  </form>-->

  <input type="button" class="button buttons" onclick="alert('Payment has been submitted.')" value="Submit">
</body>
</html>
    
<style>
body {
    padding: 5px;
    margin: auto;
    width: 550px;
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
  width: 525px;
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

.policy {
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
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
    margin: 4px 2px;
    cursor: pointer;
    transition-duration: 0.4s;
}

.buttons {
    border: 2px solid rgb(118, 119, 123);
    color: rgb(84, 86, 91);
    background-color: white;
    width: 155px;
}

#creditcard, #bankaccount {
    height: 65px;
}

.buttons:hover {
    background-color:   rgb(118, 119, 123); 
    color: white; 
}
.paypal {
    position: relative;
    top: 31px;
}

#bankform, #cardform {
    display: none;
}

#bankform input, #cardform input {
    text-align: left;
    margin: 5px 0px;
}

#bankform input:focus, #cardform input:focus, #dtpcker input:focus, textarea:focus {
    box-shadow: 0 0 5px rgba(81, 203, 238, 1);
    border: 2px solid rgba(81, 203, 238, 1);
}

#bankform input[placeholder], #cardform input[placeholder] {
    text-align: center;
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
