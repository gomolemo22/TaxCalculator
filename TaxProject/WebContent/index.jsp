<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/bootstrap/css/scrolling-nav.css" rel="stylesheet">
<title>PSiber</title>
<script type="text/javascript">
	function submitForm(){
		var tax_year = document.forms["TaxForm"]["tax_year"].value;
		var age = document.forms["TaxForm"]["age"].value;
		var total_income = document.forms["TaxForm"]["total_income"].value;
		var pay_rate = document.forms["TaxForm"]["pay_rate"].value;
		var med_num = document.forms["TaxForm"]["med_num"].value;
		
		
		if(checkForm()){
			var http = new XMLHttpRequest();
			http.open("POST","TaxServlet",true);
			http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			var data = "tax_year="+tax_year+"&age="+age+"&total_income="+total_income+"&pay_rate="+pay_rate+"&med_num="+med_num;
			http.send(data);
			http.onload = function(){
				var data = http.responseText 
				alert(data);
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

	<!-- Navigation -->
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    	<div class="container">
      		<a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
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

  <header class="bg-primary text-white">
    <div class="container text-center">
      <h1>Income Tax Calculator</h1>
      <p class="lead">A landing page template freshly redesigned for Bootstrap 4</p>
    </div>
  </header>

  <section id="tax-calculator">
  <div class="container register">
    	<div class="row">
        	<div class="col-md-3 register-left">
            	<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
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
                                	<select name="tax_year" class="form-control">
                                    	<option class="hidden"  selected disabled>Please select Tax Year</option>
                                        <option>2017</option>
                                        <option>2018</option>       
                                    </select>
                                </div>
                            	<div class="form-group">
                                	<input type="text" name="age" id="age" class="form-control" placeholder="Age *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" name="total_income" id="total_income" class="form-control" placeholder="Total income *" value="" />
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
                                	<input type="submit" class="btnRegister" onclick="return submitForm()" value="Calculate"/>
                                </div>
                           </div>
                           </form>
                           <div class="col-md-6">
                           		<!-- <div class="form-group">
                                	<input type="email" class="form-control" placeholder="R 0" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="R 0" value="" />
                                </div>
                                
                                <div class="form-group">
                                	<input type="text" class="form-control" placeholder="R 0" value="" />
                                </div>-->
                                <p id="demo">R 0</p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
    	</div>
    </div> 
  </section>
  
  <section id="services" class="bg-light">
   
  </section>


  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; PSiber Tax-Calculator 2019</p>
    </div>
    <!-- /.container -->
  </footer>
  
  <script type="text/javascript">
  
  
  
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