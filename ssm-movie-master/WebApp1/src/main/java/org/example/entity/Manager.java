package org.example.entity;

public class Manager {
    private int adminid;//工号
    private String userid;//用户名
    private String password;//密码

    private String phone;//电话

    private String email;//邮箱

    private String address;//地址

    private String id;//身份证号
    private int guarantorID;//担保人工号
    public void setGuarantorID(int gid){this.guarantorID = gid;}
    public int getGuarantorID(){ return guarantorID;}
    public void setAdminid(int adminid){ this.adminid=adminid;  }
    public int getAdminid(){ return adminid;}
    public String getUserid() {
        return userid;
    }
    public void setUserid(String username) {
        this.userid = username;
    }
    public String getpassword() {
        return password;
    }
    public void setPassword(String userpwd) {
        this.password = userpwd;
    }
    public String getphone(){ return phone; }
    public  void setphone(String telephone) { this.phone = telephone; }
    public String getEmail(){ return email; }
    public void setEmail(String email){ this.email = email; }
    public String getAddress(){ return address; }
    public void setAddress(String address){ this.address = address; }
    public String getId(){ return  id; }
    public void setId(String idcard){ this.id = idcard; }
    @Override
    public String toString() {
        return "User [username=" + userid + ", userpwd=" + password + ", email="+email+",address"+address+",phone="+phone+",id="+id+",guarantorid="+guarantorID+"]";
    }
}
