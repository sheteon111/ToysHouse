
  
<jsp:include page="cheader.jsp"></jsp:include>
<div class="main" >
    <div class="content" style="background-image: url('images/1.png'); background-repeat: no-repeat; background-size: auto; background-position: center center;">
        <div class="login_panel" style="width: 400px; left:70%;
              background: hsla(228, 70%, 70%, 0.719);
              backdrop-filter: blur(30px);
              ">
            <h3>Existing Customers</h3>
            <p>Sign in with the form below.</p>
            <form method="post" autocomplete="off">
                <input name="userid" type="text" placeholder="User ID">
                <input name="pwd" type="password" placeholder="Password">                
                <div class="buttons"><div><button class="grey">Sign In</button></div></div>
                <jsp:include page="msg.jsp"></jsp:include>
            </form>
        </div>
        <div class="register_account" style="width:450px; left:70%;
              background: hsla(228, 70%, 70%, 0.719);
              backdrop-filter: blur(30px);
              ">

        
          
            <h3>Register New Account</h3>
            <form autocomplete="off" action="/register/" method="post">
                <table>
                    <tbody>
                <tr>
                    <td>
                        <div><input name="fname" required type="text" 
                                            placeholder=" Name "> 
                                            <input name="lname" required type="text" 
                                            placeholder="Address "> 
                                            <input name="userid" required type="text" 
                                            placeholder="User ID"> 
                                            <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
                                            <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
                                            <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
                                            <script type="text/javascript">
                                            $(function() {
                                            var date = new Date();
                                            var currentMonth = date.getMonth();
                                            var currentDate = date.getDate();
                                            var currentYear = date.getFullYear();
                                            $('#txtDate2').datepicker({
                                            maxDate: new Date(currentYear, currentMonth, currentDate)
                                            });
                                            });
                                            </script>
                                            </head>
                                            <body>
                                            <input name="dob" required type="text" id="txtDate2" placeholder="DOB"/>
                                            </body>
                                            <select name="gender" required 
                                            >
                                            <option>Male</option>
                                            <option>Female</option>
                                            </select>                                
                                <input type="text" required
                                            name="email" placeholder="Email Id">
                                                                            
                                <input type="password" required name="pwd" 
                                            placeholder="Password">
                                <input type="password" required name="cpwd" 
                                        placeholder="Repeat Password">
                    </td>                            
                </tr> 
                    </tbody></table> 
                <div class="buttons"><div><button class="grey">Create Account</button></div></div>
                <p class="terms">By clicking 'Create Account' you agree to the <a href="#">Terms &amp; Conditions</a>.</p>
                <div class="clear"></div>
            </form>
        </div>  	
        <div class="clear"></div>
         <jsp:include page="footer.jsp"></jsp:include>
    </div>
   
</div>


