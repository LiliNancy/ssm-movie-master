package org.example.entity;

public class User {
    private String username;
    private String password;

    private String phone;

    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return password;
    }

    public void setUserpwd(String userpwd) {
        this.password = userpwd;
    }

    public String getTelephone(){return phone;}

    public  void setTelephone(String telephone) { this.phone = telephone;}

    public String getEmail(){return email;}

    public void setEmail(String email){this.email = email;}

    @Override
    public String toString() {
        return "User [username=" + username + ", userpwd=" + password + ", email="+getEmail()+" ,telephone"+getTelephone()+"]";
    }

}
