package org.gomolemo.project;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaxServlet
 */
@WebServlet("/TaxServlet")
public class TaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		String tax_year = request.getParameter("tax_year");
		String age = request.getParameter("age");
		String total_income = request.getParameter("total_income");
		String pay_rate = request.getParameter("pay_rate");
		String med_num = request.getParameter("med_num");
		
		System.out.println(tax_year+" "+age+" "+total_income+" "+pay_rate+" "+med_num);
		
		TaxCalculator obj = new TaxCalculator(tax_year, age, total_income, pay_rate, med_num);
		System.out.println("The gross income R"+obj.toString(obj.getGross()));
		System.out.println("The rebate value R"+obj.toString(obj.getRebate()));
		obj.taxCalulate();
		//System.out.println("The tax rates "+obj.toString(obj.getTaxRates()[0]));
		System.out.println("The tax R"+obj.toString(obj.getMonthlyTaxDue()));
		System.out.println("The tax R"+obj.toString(obj.getAnnualTaxDue()));
		System.out.println("Tax credits R"+obj.toString(obj.getTaxCredits()));
		System.out.println("The net pay R"+obj.toString(obj.getNet_PAYE()));
		
		String data = obj.toString(obj.getMonthlyTaxDue())+","+obj.toString(obj.getAnnualTaxDue())+","+obj.toString(obj.getTaxCredits())+","+obj.toString(obj.getNet_PAYE());
		PrintWriter writer = response.getWriter();
		writer.print(data);
		
		
	}

}
