
package Model;

public class Account {
    private String user ;
    private String password ;
    private  int role ;

    public Account() {
    }

    public Account( String user, String password, int role) {
        
        this.user = user;
        this.password = password;
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "user=" + user + ", password=" + password + ", role=" + role + '}';
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    
}
