package Model;

import Context.MyDAO;

import java.util.ArrayList;
import java.util.List;

public class DAO extends MyDAO {

    public List<Book> getAllBooks() {
        List<Book> t = new ArrayList<>();
        xSql = "select * from Books";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            Book x;
            while (rs.next()) {

                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public List<Category> getAllCategory() {
        List<Category> t = new ArrayList<>();
        xSql = " select * from categories";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            Category x;
            while (rs.next()) {
                x = new Category(rs.getInt(1), rs.getString(2));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Book getBook() {
        xSql = "select top 1* from Books\n"
                + "order by book_id desc ";

        Book x = null;
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if (rs.next()) {

                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public List<Book> getCategoryByid(String id) {
        List<Book> t = new ArrayList<>();
        xSql = "select * from Books\n"
                + "where category_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Book x;
            while (rs.next()) {
                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Book getDetailBook(String id) {
        xSql = "select * from Books\n"
                + "where book_id = ?";
        Book x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public Account getAccount(String user, String pass) {
        xSql = "select * from Users\n"
                + "where username = ? and password = ?";
        Account x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Account(rs.getString(2), rs.getString(3), rs.getInt(4));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void insertAcc(Account a) {
        xSql = "INSERT INTO Users ( username, password, role) VALUES (?,?,?)";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, a.getUser());
            ps.setString(2, a.getPassword());
            ps.setInt(3, a.getRole());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Account checkAccount(String user) {
        xSql = "select * from Users\n"
                + "where username = ? ";

        Account x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Account(rs.getString(2), rs.getString(3), rs.getInt(4));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public List<Book> searchByTxt(String txt) {
        List<Book> t = new ArrayList<>();
        xSql = "select * from Books where book_name like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            Book x;
            while (rs.next()) {
                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public void insertBook(String title, int price, String image, String author, String name, int category) {
        xSql = "INSERT INTO Books ( title, [price], image , author ,book_name ,category_id) VALUES (?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, title);
            ps.setInt(2, price);
            ps.setString(3, image);
            ps.setString(4, author);
            ps.setString(5, name);
            ps.setInt(6, category);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editBook(String title, String price, String image, String author, String name, int category, String id) {
        xSql = "Update Books set   title = ? , price = ? , image = ? , author = ? ,book_name = ? ,category_id = ?  where book_id = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, title);
            ps.setString(2, price);
            ps.setString(3, image);
            ps.setString(4, author);
            ps.setString(5, name);
            ps.setInt(6, category);
            ps.setString(7, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void delete(String id) {
        xSql = "delete from Books where book_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Book checkBook(int id) {
        xSql = "select * from Books\n"
                + "where book_id = ? ";

        Book x = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public int CountBook() {
        xSql = "select COUNT (*) from Books";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Book> pagingBook(int index) {
        List<Book> t = new ArrayList<>();
        xSql = "select * from Books\n"
                + "order by book_id asc\n"
                + "offset ? rows fetch next 9 rows only";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, (index - 1)*9);
            rs = ps.executeQuery();
            Book x;
            while (rs.next()) {
                x = new Book(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        List<Book> l = d.pagingBook(0);
        for (Book book : l) {
            System.out.println(book);
            
        }
        

    }
}
