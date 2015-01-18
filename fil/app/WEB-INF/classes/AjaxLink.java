import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class AjaxLink extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Context ctx = null;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
      Class.forName("org.postgresql.Driver");
    } catch (Exception e) {
    }

    try{
      String table = request.getParameter("table");

      ctx = new InitialContext();
      DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/fil");
      con = ds.getConnection();
      stmt = con.createStatement();

      if (table != null) {
        rs = stmt.executeQuery("select array_to_json(array_agg(t)) from " + table + " t");
      } else {
        rs = stmt.executeQuery("select '{version: ' || to_json(version()) || '}'");
      }

      PrintWriter out = response.getWriter();
      response.setContentType("application/json");

      while(rs.next())
      {
        out.print(rs.getString(1));
      }

    }catch(NamingException e){
      System.err.println("NamingException " + e);
      e.printStackTrace();
    } catch (SQLException e) {
      System.err.println("SQLException " + e);
    } catch (Exception e) {
      System.err.println("Exception " + e);
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }

        if (stmt != null) {
          stmt.close();
        }
        if (con != null) {
          con.close();
        }

        if (ctx != null) {
          ctx.close();
        }
      } catch (SQLException e) {
        System.out.println("Exception in closing DB resources");
      } catch (NamingException e) {
        System.out.println("Exception in closing Context");
      }

    }
  }
}
