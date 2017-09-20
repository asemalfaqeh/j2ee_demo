package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Seller
 */
@WebServlet("/Seller")
public class Seller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Seller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String path = request.getParameter("action");
		if(path.equals("delete")){
			request.getRequestDispatcher("/DeleteSeller.jsp").forward(request, response);
		}else if(path.equals("update")){
			request.getRequestDispatcher("/UpdateSeller.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pathpost = request.getParameter("seller");
		if(pathpost.equals("newseller")){
		request.getRequestDispatcher("/NewSeller.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
	}

}
