package Controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.sun.corba.se.spi.orbutil.fsm.Action;

import DaoMVC.DAoMVC;
import Model.PaymentBean;

/**
 * Servlet implementation class Payment
 */
@WebServlet(name = "Payment.do", urlPatterns = { "/Payment.do" })
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private DataSource dataSource;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub

		try {
			InitialContext initialContext = new InitialContext();
			Context context = (Context) initialContext.lookup("java:/comp/env");
			dataSource = (DataSource) context.lookup("jdbc/servletdb");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
	    
		RequestDispatcher req = getServletContext().getRequestDispatcher("payment.jsp");
		request.setAttribute("msg","");
		req.forward(request,response);
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher req = request.getRequestDispatcher("payment.jsp");
		request.setAttribute("msg","");
		req.forward(request,response);
		
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        
		String action = request.getParameter("payment");
		
		if(action.equals("payment")){
		String date = request.getParameter("date");
		String amount = request.getParameter("amount");
		String product = request.getParameter("product");
		String pay = request.getParameter("pay");
		String quantity = request.getParameter("quantity");
		String nameseller = request.getParameter("nameseller");
		
		PaymentBean paymentBean = new PaymentBean();
		paymentBean.setDate(date);
		paymentBean.setAmount(amount);
		paymentBean.setProduct(product);
		paymentBean.setPay(pay);
		paymentBean.setQuantity(quantity);
		paymentBean.setNameseller(nameseller);
		
		try {
			DAoMVC dao = new DAoMVC(connection);
			int i = dao.AddPayment(paymentBean);
			if (i == 0) {
				request.setAttribute("msg","Not Inserted");
				request.getRequestDispatcher("/payment.jsp");
				req.forward(request, response);
			}else{
				request.setAttribute("msg","Inserted");
				request.getRequestDispatcher("/payment.jsp");
				req.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }
		}else if(action.equals(null)){
			request.getRequestDispatcher("/Home.jsp").forward(request, response);
			return;
		}
	}

}




