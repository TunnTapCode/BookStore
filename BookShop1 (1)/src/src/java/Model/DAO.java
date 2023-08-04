package Model;

import Context.MyDAO;

import java.util.ArrayList;
import java.util.List;


public class DAO extends  MyDAO{

  public List<Book> getAllBooks() {
    List<Book> t = new ArrayList<>();
    xSql = "select * from Books";
    try {
      ps = con.prepareStatement(xSql);
      rs = ps.executeQuery();
     
      Book x;
      while(rs.next()) {
        
        x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
        t.add(x);
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
  }
   
   public List<Category> getAllCategory() {
    List<Category> t = new ArrayList<>();
    xSql = " select * from categories";
    try {
      ps = con.prepareStatement(xSql);
      rs = ps.executeQuery();
     
      Category x;
      while(rs.next()) {
        x = new Category(rs.getInt(1), rs.getString(2));
        t.add(x);
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
  }
   public Book getBook() {
    xSql = "select top 1* from Books\n" +
"order by book_id desc ";
      
      Book x = null;
    try {
      ps = con.prepareStatement(xSql);
      rs = ps.executeQuery();
      if(rs.next()) {
      
        x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(x);
  }
    public static void main(String[] args) {
        DAO d = new DAO();
        List<Book> list = d.getAllBooks();
        for (Book o : list) {
            System.out.println(o);  
        }
        
    }
}
