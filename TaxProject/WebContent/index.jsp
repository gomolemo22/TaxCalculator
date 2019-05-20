 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/bootstrap/css/scrolling-nav.css" rel="stylesheet">
<title>PSiber</title>
<%
String[] results =  {"0","0","0","0"};
%>
<script type="text/javascript">
	function submitForm(){
		var tax_year = document.forms["TaxForm"]["tax_year"].value;
		var age = document.forms["TaxForm"]["age"].value;
		var total_income = document.forms["TaxForm"]["total_income"].value;
		var pay_rate = document.forms["TaxForm"]["pay_rate"].value;
		var med_num = document.forms["TaxForm"]["med_num"].value;
		var data;
		
		if(checkForm()){
			var http = new XMLHttpRequest();
			http.open("POST","TaxServlet",true);
			http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			var data = "tax_year="+tax_year+"&age="+age+"&total_income="+total_income+"&pay_rate="+pay_rate+"&med_num="+med_num;
			http.send(data);
			http.onload = function(){
				var data = http.responseText
				//alert(data);
				window.location.href="index.jsp?value=" + data;
				
			}
		}
		
		
		
	}
	
	function checkForm(){
		var tax_year = document.forms["TaxForm"]["tax_year"].value;
		var age = document.forms["TaxForm"]["age"].value;
		var total_income = document.forms["TaxForm"]["total_income"].value;
		var med_num = document.forms["TaxForm"]["med_num"].value;
		var pay_rate = document.forms["TaxForm"]["pay_rate"].value;
		
		if(tax_year == ""){
			alert("please select tax year");
			return false;
		}
		
		if(age == ""){
			alert("please enter your age");
			return false;
		}else if(isNaN(age)){
			alert("please enter valid age");
			return false;
		}
		
		if(total_income == ""){
			alert("please enter your age");
			return false;
		}else if(isNaN(total_income)){
			alert("please enter valid age");
			return false;
		}
		
		if(pay_rate == ""){
			alert("please select tax year");
			return false;
		}
		
		if(isNaN(med_num)){
			alert("please enter valid number of medical aid users");
			return false;
		}
		
		
		
		return true;
	}
</script>
</head>
<body>
<%
	String value = request.getParameter("value");
	if(value != null){
		String[] arrOfStr = value.split(",", -2); 
		int count = 0;
        for (String a : arrOfStr){
        	results[count] = a;
        	count++;
        }
	}
%>


	<!-- Navigation -->
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    	<div class="container">
      		<a class="navbar-brand js-scroll-trigger" href="#page-top">PSiber</a>
      		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        		<span class="navbar-toggler-icon"></span>
      		</button>
      		<div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		         	<li class="nav-item">
		            	<a class="nav-link js-scroll-trigger" href="#tax-calculator">Tax Calculator</a>
		          	</li>
		          	<li class="nav-item">
		            	<a class="nav-link js-scroll-trigger" href="#tax-tables">Tax Tables</a>
		          	</li>
		        </ul>
      		</div>
    	</div>
  	</nav>

 

  <section id="tax-calculator">
  <div class="container register">
    	<div class="row">
        	<div class="col-md-3 register-left ">
            	<img src="images/PSIber-logo-webiste.jpg" alt=""/>
                <br>
                <h3>Welcome</h3>
                <p>Try out our 2017/2018 tax calculator and find out your monthly income tax and the tax deductions available and compare it to last year's monthly income tax and tax deductions</p>
                
            </div>
            
            <div class="col-md-9 register-right shadow-lg bg-light">
            	<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                	<li class="nav-item">
                    	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Tax Calculator</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link disabled" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"></a>
                    </li>
                </ul>
                <form id="TaxForm" method="post" name="TaxForm" autocomplete="off">
                <div class="tab-content" id="myTabContent">
                	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    	<h3 class="register-heading">Income</h3>
                        <div class="row register-form">
                        	<div class="col-md-6">
                            	<div class="form-group">
                                	<select name="tax_year" class="form-control" required>
                                    	<option class="hidden"  selected disabled>Please select Tax Year</option>
                                        <option>2017</option>
                                        <option>2018</option>       
                                    </select>
                                </div>
                            	<div class="form-group">
                                	<input type="text" name="age" id="age" class="form-control" value="" placeholder="Age *" />
                                </div>
                                <div class="form-group">
                                    <input type="text" name="total_income" id="total_income" class="form-control" value="" placeholder="Total income *" />
                                </div>
                                <div class="form-group">
	                                <div class="maxl">
	                                    <select name="pay_rate" class="form-control">
	                                    	<option class="hidden"  selected disabled>Please select Pay Rate</option>
	                                        <option>Monthly</option>
	                                        <option>Annually</option>       
	                                    </select>
	                                </div>
                           		</div>
                           		<div class="form-group">
                                    <input type="text" name="med_num" id="med_num" class="form-control" placeholder="Number of medical aid users" value="" />
                                </div>
                                <div class="form-group text-right">
                                	<input type="submit" class="btn-block btn-success btnRegister" onclick="return submitForm()" value="Calculate"/>
                                </div>
                           </div>
                           </form>
                           
                           <div class="col-md-6">
                           		<ul class="list-group list-group-flush">
								  <li class="list-group-item"><div class="col">Monthly Tax Due:</div><div class="col">R <span id="monthlyTax"><%=results[0] %></span></div></li>
								  <li class="list-group-item"><div class="col">Annual Tax Due:</div><div class="col">R <span id="annualTax"><%=results[1] %></span></div></li>
								  <li class="list-group-item"><div class="col">Tax Credits:</div><div class="col">R <span id="taxCredits"><%=results[2] %></span></div></li>
								  <li class="list-group-item"><div class="col">Net PAYE:</div><div class="col">R <span id="netPay"></span><%=results[3] %></div></li>
								</ul>		
                           </div>
                        </div>
                    </div>
                </div>
                
            </div>
    	</div>
    </div> 
  </section>
  
  <button class="tablink" onclick="openPage('Home', this, 'green')">2017 Tax Table</button>
  <button class="tablink" onclick="openPage('News', this, 'green')" id="defaultOpen">2018 Tax Table</button>
  <section id="services" class="bg-light" style="background-image: url('images/taxes-season-wall-ss-1920.jpg');background-repeat: no-repeat;">
  	<div class="container">
    	<div class="row">
    		<div class="col-lg-12 shadow-lg"> 
 
    			<% String [][] tax_list_2017 = {{"0 - 188 000","18% of taxable income"},
		                     {"188 001 - 293 600","33 840 + 26% of taxable income above 188 000"},
		                     {"293 601 - 406 400","61 296 + 31% of taxable income above 293 600"},
		                     {"406 401 - 550 100","96 264 + 36% of taxable income above 406 400"},
		                     {"550 101 - 701 300","147 996 + 39% of taxable income above 550 100"},
		                     {"701 301 and above","206 964 + 41% of taxable income above 701 300"}};
		         
    			String [][] tax_list_2018 = {{"0 - 189 880","18% of taxable income"},
	                     {"189 881 - 296 540","34 178 + 26% of taxable income above 189 880"},
	                     {"296 541 - 410 460","61 296 + 61 910 + 31% of taxable income above 296 540"},
	                     {"410 461 - 555 600","97 225 + 36% of taxable income above 410 460"},
	                     {"555 601 - 708 310","149 475 + 39% of taxable income above 555 600"},
	                     {"708 311 - 1 500 000","209 032 + 41% of taxable income above 708 310"},
	                     {"1 500 001 and above","533 625 + 45% of taxable income above 1 500 000"}};
		         %>
    			<div id="Home" class="tabcontent">
				  <table class="table table-striped text-center">
				    <thead class="bg-dark text-white">
				      <tr>
				        <th>Taxable Income</th>
				        <th>Rate of Tax</th>
				      </tr>
				    </thead>
				    <tbody class="bg-light text-black">
				      <% for(int x = 0; x < tax_list_2017.length-1;x++){ %>
				      <tr>
				        <td><%=tax_list_2017[x][0] %></td>
				        <td><%=tax_list_2017[x][1] %></td>
				      </tr>
				      <%} %>
				    </tbody>
				    <thead class="bg-dark text-white">
                            <tr>
                                <th>Rebate</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody class="bg-light text-black">
                            <tr>
                                <td>Primary</td>
                                <td>R13 635</td>
                            </tr>
                            <tr>
                                <td>Secondary (Persons 65 and older)</td>
                                <td>R7 479</td>
                            </tr>
                            <tr>
                                <td>Tertiary (Persons 75 and older)</td>
                                <td>R2 493</td>
                            </tr>
                        </tbody>
				    <thead class="bg-dark text-white">
                            <tr>
                                <th>Age</th>
                                <th>Tax Threshold</th>
                            </tr>
                        </thead>
                        <tbody class="bg-light text-black">
                            <tr>
                                <td>Below age 65</td>
                                <td>R75 750</td>
                            </tr>
                            <tr>
                                <td>Age 65 to 75</td>
                                <td>R117 300</td>
                            </tr>
                            <tr>
                                <td>Age 75 and over</td>
                                <td>R131 150</td>
                            </tr>
                        </tbody> 
				  </table>
				</div>
    		</div>


    		<div class="col-lg-12 shadow-lg"> 
    			<div id="Home" class="tabcontent">
				  
				</div>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-lg-12">
    			<div id="News" class="tabcontent">
				  <table class="table table-striped text-center">
				    <thead class="bg-dark text-white">
				      <tr>
				        <th>Taxable Income</th>
				        <th>Rate of Tax</th>
				      </tr>
				    </thead>
				    <tbody class="bg-light text-black">
				      <% for(int x = 0; x < tax_list_2018.length-1;x++){ %>
				      <tr>
				        <td><%=tax_list_2018[x][0] %></td>
				        <td><%=tax_list_2018[x][1] %></td>
				      </tr>
				      <%} %>
				    </tbody>
				    <thead class="bg-dark text-white">
                            <tr>
                                <th>Rebate</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody class="bg-light text-black">
                            <tr>
                                <td>Primary</td>
                                <td>R13 500</td>
                            </tr>
                            <tr>
                                <td>Secondary (Persons 65 and older)</td>
                                <td>R7 407</td>
                            </tr>
                            <tr>
                                <td>Tertiary (Persons 75 and older)</td>
                                <td>R 2 466</td>
                            </tr>
                        </tbody>
				    <thead class="bg-dark text-white">
                            <tr>
                                <th>Age</th>
                                <th>Tax Threshold</th>
                            </tr>
                        </thead>
                        <tbody class="bg-light text-black">
                            <tr>
                                <td>Below age 65</td>
                                <td>R75 000</td>
                            </tr>
                            <tr>
                                <td>Age 65 to 75</td>
                                <td>R116 150</td>
                            </tr>
                            <tr>
                                <td>Age 75 and over</td>
                                <td>R129 850</td>
                            </tr>
                        </tbody> 
				  </table> 
				</div>
    		</div>
    	</div>
	</div>
  </section>


  <!-- Footer -->
  <footer class="py-5 bg-dark" style="margin-top: -20px;">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; PSiber Tax-Calculator 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  
  <style>
  nav > .nav.nav-tabs{

  border: none;
    color:#fff;
    background:#272e38;
    border-radius:0;

}
nav > div a.nav-item.nav-link,
nav > div a.nav-item.nav-link.active
{
  border: none;
    padding: 18px 25px;
    color:#fff;
    background:#272e38;
    border-radius:0;
}

nav > div a.nav-item.nav-link.active:after
 {
  content: "";
  position: relative;
  bottom: -60px;
  left: -10%;
  border: 15px solid transparent;
  border-top-color: #e74c3c ;
}
.tab-content{
  background: #fdfdfd;
    line-height: 25px;
    border: 1px solid #ddd;
    border-top:5px solid #e74c3c;
    border-bottom:5px solid #e74c3c;
    padding:30px 25px;
}

nav > div a.nav-item.nav-link:hover,
nav > div a.nav-item.nav-link:focus
{
  border: none;
    background: #e74c3c;
    color:#fff;
    border-radius:0;
    transition:background 0.20s linear;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 50%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

  </style>
<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom JavaScript for this theme -->
<script src="js/scrolling-nav.js"></script>
</html>