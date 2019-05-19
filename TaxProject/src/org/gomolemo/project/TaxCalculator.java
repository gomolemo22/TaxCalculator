package org.gomolemo.project;

public class TaxCalculator {
	private final static double [] per_of_tax = {0.18,0.26,0.31,0.36,0.39,0.41,0.45};
	private final static double [][] rate_of_tax_2018 = {
		{0,0},
		{34178,189880},
		{61910,296540},
		{97225,410460},
		{149475,555600},
		{209032,708310},
		{533625,1500000}
	};
	
	private final static double [][] rate_of_tax_2017 ={
		{0,0},
		{33840,188000},
		{61296,293600},
		{96264,406400},
		{147996,550100},
		{206964,701300}
	};
	
	
	
	private int tax_year;
	private int age;
	private int med_num;
	private String pay_rate;
	private double gross_pay;
	private double net_paye;
	private double tax;
	private double rebate_value;
	private double[] tax_rates = {0,0};
	private double percentage;
	private double tax_credits;
	
	private final double[] tax_rebates_2017 = {13500,7407,2466};
	private final double[] tax_rebates_2018 = {13635,7479,2493};
	
	TaxCalculator(String tax_year,String age,String income,String p_rate,String med_num){
		try {
			this.tax_year = Integer.parseInt(tax_year);
			this.age = Integer.parseInt(age);
			this.pay_rate = p_rate;
			this.med_num = Integer.parseInt(med_num);
			
			if(pay_rate.equalsIgnoreCase("monthly")){
				gross_pay = Double.parseDouble(income);
			}else{
				gross_pay = Double.parseDouble(income)/12;
			}
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}
		
	}
	
	public double getNet_PAYE(){
		net_paye = getGross()-getMonthlyTaxDue();
		return net_paye;
	}
	
	public void taxCalulate(){
		
		setTaxRates(); 

		tax = 0.0;
		if(checkThreshold()){
			tax = (getTaxRates()[0]+(percentage*((gross_pay*12)-getTaxRates()[1])))-getRebate();
		}
		
		
	}
	
	
	public boolean checkThreshold(){	
		if(tax_year == 2017){
			if(age < 65 && (gross_pay*12) <= 75000){
				return false;
			}else if(age >= 65 && age < 75 && (gross_pay*12) <= 116150){
				return false;
			}else if(age >= 75 && (gross_pay*12) <= 129850){
				return false;
			}
			
		}else if(tax_year == 2018){
			if(age < 65 && (gross_pay*12) <= 75750){
				return false;
			}else if(age >= 65 && age < 75 && (gross_pay*12) <= 117300){
				return false;
			}else if(age >= 75 && (gross_pay*12) <= 131150){
				return false;
			}
		}
			
		return true;
	}
	
	
	public double getRebate(){
		if(tax_year == 2017){
			if(age < 65){
				rebate_value = tax_rebates_2017[0];
			}else if(age >= 65 && age < 75){
				rebate_value = tax_rebates_2017[1];
			}else{
				rebate_value = tax_rebates_2017[2];
			}
		} else if(tax_year == 2018){
			if(age < 65){
				rebate_value = tax_rebates_2018[0];
			}else if(age >= 65 && age < 75){
				rebate_value = tax_rebates_2018[1];
			}else{
				rebate_value = tax_rebates_2017[2];
			}
		}
		
		return rebate_value;
	}
		
	public void setTaxRates(){
		
		int pos = 0;
		double total_pay = gross_pay*12;
		
		if(tax_year == 2017){
			if(total_pay > 0 && total_pay <= 188000 ){
				pos = 0;
			}else if(total_pay > 188001 && total_pay <= 293600){
				pos = 1;
			}else if(total_pay > 293601 && total_pay <= 406400){
				pos = 2;
			}else if(total_pay > 406401 && total_pay <= 550100){
				pos = 3;
			}else if(total_pay > 550101 && total_pay <= 701300){
				pos = 4;
			}else if(total_pay > 701301){
				pos = 5;
			}
			
		} else if(tax_year == 2018){
			if(total_pay > 0 && total_pay <= 189880 ){
				pos = 0;
			}else if(total_pay > 189881 && total_pay <= 296540){
				pos = 1;
			}else if(total_pay > 296541 && total_pay <= 410460){
				pos = 2;
			}else if(total_pay > 410461 && total_pay <= 555600){
				pos = 3;
			}else if(total_pay > 555601 && total_pay <= 708310){
				pos = 4;
			}else if(total_pay > 708311 && total_pay <= 1500000){
				pos = 5;
			}else if(total_pay > 1500001){
				pos = 6;
			}
		}
		
		switch (tax_year) {
		case 2017:
			tax_rates[0] = rate_of_tax_2017[pos][0]; 
			tax_rates[1] = rate_of_tax_2017[pos][1];
			break;
		case 2018:
			tax_rates[0] = rate_of_tax_2018[pos][0]; 
			tax_rates[1] = rate_of_tax_2018[pos][1];
			break;
		default:
			break;
		}
		
	
		percentage = per_of_tax[pos];
		
	}
	
	public double getTaxCredits(){
		
		int additional = 0;
		
		if(med_num == 0){
			tax_credits = 0;
		}
		
		if(tax_year == 2017){
			if(med_num < 2){
				tax_credits = 286*med_num;
				
			}else if(med_num > 2){
				additional = med_num - 2;
				tax_credits = (286*2)+(192*(additional));
			}
		}else if(tax_year == 2018){
			if(med_num < 2){
				tax_credits = 303*med_num;
				
			}else if(med_num > 2){
				additional = med_num - 2;
				tax_credits = (303*2)+(204*(additional));
			}
		}
		
		
		return tax_credits;
	}
	
	public double getGross(){
		return gross_pay;
	}

	public double getMonthlyTaxDue(){
		return tax/12;
	}
	
	public double getAnnualTaxDue(){
		return tax;
	}
	
	public double[] getTaxRates(){
		return tax_rates;
	}
	
	public String toString(double value){
		return String.format("%.2f",value);
	}

}
