package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Model.CreateBeans;
import Model.DataBaseSQL;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/Login")

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private DataSource dataSource;
	private HttpSession session;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    //For Connection Database
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String getparam = request.getParameter("action");
	    session = request.getSession();
		session.setAttribute("msg","");
		session.setAttribute("email","");
		session.setAttribute("email2", "");
		session.setAttribute("pass", "");
		session.setAttribute("name", "");
		session.setAttribute("reg", "");
		session.setAttribute("country", "");
		session.setAttribute("ph", "");
		
		request.getRequestDispatcher("index.jsp").forward(request, response);    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		
		try {
		  connection = dataSource.getConnection();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		String action = request.getParameter("action");
	
		if(action.equals("action")){
			String email = request.getParameter("uname");
		    String password = request.getParameter("psw");
		try {
			DataBaseSQL loginBean = new DataBaseSQL(connection);
			if(loginBean.Validate(email,password)){
				request.setAttribute("msg","Success");
				session.setAttribute("Email",email);
				session.setAttribute("Session","true");
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
			}else{
				session.setAttribute("email",email);
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}	
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		  }
		}
		//insert
		else if(action.equals("insert")){
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("shopingname");
			String phone = request.getParameter("phone");
			String region = request.getParameter("region");
			String country = request.getParameter("country");
			
			DataBaseSQL dataBaseSQL = new DataBaseSQL(connection);
			CreateBeans createBeans = new CreateBeans(name, phone, password, email, country, region);
			
			if(createBeans.ValidateCreate(name, email, phone, region, country, password)){
				try {
					dataBaseSQL.insert(name, email, password, region, country, phone);
					request.setAttribute("msg","Insert Success!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					session.setAttribute("msg","Error Connection Please try Again");
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("email2", email);
			session.setAttribute("pass", password);
			session.setAttribute("name", name);
			session.setAttribute("reg", region);
			session.setAttribute("country", country);
			session.setAttribute("ph", phone);
			session.setAttribute("msg",createBeans.getMasseg());
			request.getRequestDispatcher("CreateProfile.jsp").forward(request, response);
		 }else{
			 request.setAttribute("msg","Form Not Found");
				return;
		 }
		
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
		
	}
}
