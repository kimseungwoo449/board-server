package boardServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardServer.user.model.UserDao;
import boardServer.user.model.UserRequestDto;
import boardServer.user.model.UserResponseDto;

/**
 * Servlet implementation class UpdateUserFormAction
 */
@WebServlet("/UpdateUserFormAction")
public class UpdateUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserFormAction() {
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
		
		HttpSession session = request.getSession();
		
		String curId = request.getParameter("cur-id");
		String curPassword = request.getParameter("password");
		String newPassword = request.getParameter("new-password");
		String newEmail = request.getParameter("new-email");
		String newPhone = request.getParameter("new-phone");

		boolean isValid = true;

		if (curId == null || curId.equals("") || curPassword == null || curPassword.equals(""))
			isValid = false;

		if (!isValid) {
			response.sendRedirect("/updateUserForm");
		} else {
			UserDao userDao = UserDao.getInstance();
			UserResponseDto loginUser = (UserResponseDto) session.getAttribute("user");
			UserResponseDto targetUser = userDao.findUserByIdAndPassword(curId, curPassword);

			if (targetUser != null && targetUser.getId().equals(loginUser.getId())) {
				UserRequestDto user = new UserRequestDto(curId, curPassword);
				UserResponseDto temp = null;
				if (newEmail != null&&!newEmail.equals("")) {
					temp = userDao.updateUserEmail(user, newEmail);
					System.out.println("이메일 수정성공");
				}

				if (newPhone != null&&!newPhone.equals("")) {
					temp =userDao.updateUserPhone(user, newPhone);
					System.out.println("폰번 수정성공");
				}

				if (newPassword != null&&!newPassword.equals("")) {
					System.out.println("비밀번호 수정성공");
					temp =userDao.updateUserPassword(user, newPassword);
				}
				session.setAttribute("user", temp);
				response.sendRedirect("/mypage");
				
			} else{
				response.sendRedirect("/updateUserForm");
			}
		}
	}

}
