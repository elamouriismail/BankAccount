package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
import Entity.User;
import Session.UserFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(urlPatterns = {"/ConnexionAction"})
public class ConnexionAction extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		//Tableau pour noter les erreurs éventuelles
		ArrayList erreurs = new ArrayList();

		//récupérer les données de session si elles existent déjà				
		out.println("Dans la validation de formualire...");
		String login =request.getParameter("login");
		String password =request.getParameter("password");
		
		//Tester les paramètres du formulaires
		if (login==null || login.equals(""))
			erreurs.add("Veuillez remplir le champ login");
		if (password==null || password.equals(""))
			erreurs.add("Veuillez remplir le champ password");
                
		out.println("Login:"+login);
		out.println("Mot de passe:"+password);
		
		//Gestion des erreurs du formulaire
		if (erreurs.size()!=0)
		{  
			request.setAttribute("erreurs", erreurs);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} 
		else
		{
				
				// Récupérer l'utilisateur correspondant aux paramètres saisis
				User u = userFacade.getUserByLoginPassword(login, password);

				// s'il est existant, le placer dans la session
				if (u!=null)
				{
				HttpSession session = request.getSession(true);
				session.setAttribute("user", u); 
                                response.sendRedirect("AcceuilServet");
				}                                
				else
				{ 
                                    erreurs.add("Veuillez saisir correctement vos paramètres de connexion...");
                                    request.setAttribute("erreurs", erreurs);
                                    request.getRequestDispatcher("index.jsp").forward(request, response);

				}
                }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
