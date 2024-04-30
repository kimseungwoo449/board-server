package boardServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardServer.user.model.UserDao;
import boardServer.user.model.UserRequestDto;
import boardServer.user.model.UserResponseDto;

/**
 * Servlet implementation class DeleteFormAction
 */
@WebServlet("/DeleteFormAction")
public class DeleteFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		boolean isValid = true;

		if (password == null || password.equals(""))
			isValid = false;
		
		if(!isValid){
			response.sendRedirect("/mypage");
		}else{
			UserDao userDao = UserDao.getInstance();
			
			HttpSession session = request.getSession();
			
			UserResponseDto loginUser = (UserResponseDto) session.getAttribute("user");
			UserResponseDto targetUser = userDao.findUserByIdAndPassword(id, password);
		
			if (targetUser != null && targetUser.getId().equals(loginUser.getId())) {
				UserRequestDto user = new UserRequestDto(id, password);
				userDao.deleteUser(user);
				response.sendRedirect("/logIn");
			}else{
				response.sendRedirect("/mypage");
			}
		}
	}

}
