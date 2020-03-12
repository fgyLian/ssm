package com.nm.test5.pojo;

public class Users {
    private Integer user_id;
    private Integer dep_id;
    private String user_name;
    private String user_sex;
    private Integer user_state;

    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    /*辅助属性*/
    private String ck;


    public String getCk() {
        ck="<input type='checkbox' name='user_id' value='"+this.getUser_id()+"'/>";
        return ck;
    }

    public void setCk(String ck) {
        this.ck = ck;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }


    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }

    public Integer getUser_state() {
        return user_state;
    }

    public void setUser_state(Integer user_state) {
        this.user_state = user_state;
    }

    @Override
    public String toString() {
        return "Users{" +
                "user_id=" + user_id +
                ", dep_id=" + dep_id +
                ", user_name='" + user_name + '\'' +
                ", user_sex='" + user_sex + '\'' +
                ", user_state=" + user_state +
                '}';
    }
}
