/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Operation;
import Entity.User;
import Session.AccountFacadeLocal;
import Session.OperationFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "OperationAction", urlPatterns = {"/OperationAction"})
public class OperationAction extends HttpServlet {

    @EJB
    private OperationFacadeLocal operationFacade;
    
    @EJB
    private AccountFacadeLocal accountFacade;
    ArrayList erreurs = new ArrayList();
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
        List<Account> accounts = accountFacade.findAll();            
            request.setAttribute("accounts", accounts);
         request.getRequestDispatcher("operation.jsp").forward(request, response);
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
        erreurs.clear();
        double amount=Double.parseDouble(request.getParameter("amount"));         
        String type=request.getParameter("type"); 
        Long accountNumber = Long.parseLong(request.getParameter("account"));
        Account account = new Account();
        Operation operation = new Operation();
        account=accountFacade.find(accountNumber);
        User user = account.getUser();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH.mm");
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            sdf.format(timestamp);
        if(account.getBalance() < amount && !type.equals("Deposit") ){
            
                    erreurs.add("Amount > than your barlance");
        }
        if (erreurs.size()!=0)
			{ 
				// en cas d'existence de champs nulls
				request.setAttribute("erreurs", erreurs);
                                doGet(request, response);
			}else{
        
        operation.setDateOperation(timestamp.toString());
        operation.setAmount(amount);
        operation.setUser(user); 
        operation.setTypeOperation(type);
        operation.setAccount(account);
        if(type.equals("Deposit")){
            
        account.setBalance(account.getBalance()+amount);
        }
        else{        
                account.setBalance(account.getBalance()-amount);
        }
        operationFacade.create(operation); 
        accountFacade.edit(account);
        doGet(request, response);
    }}

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
