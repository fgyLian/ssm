package com.nm.test5.pojo;

public class Department {
    private Integer dep_id;
    private String dep_name;
    private Integer dep_state;
    private String dep_desc;

    /*辅助属性*/
    private String ck;


    public String getCk() {
        ck="<input type='checkbox' name='dep_id' value='"+this.getDep_id()+"'/>";
        return ck;
    }

    public void setCk(String ck) {
        this.ck = ck;
    }



    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public Integer getDep_state() {

        return dep_state;
    }

    public void setDep_state(Integer dep_state) {
        this.dep_state = dep_state;
    }

    public String getDep_desc() {

        return dep_desc;
    }

    public void setDep_desc(String dep_desc) {
        this.dep_desc = dep_desc;
    }


    @Override
    public String toString() {
        return "Department{" +
                "dep_id=" + dep_id +
                ", dep_name='" + dep_name + '\'' +
                ", dep_state=" + dep_state +
                ", dep_desc='" + dep_desc + '\'' +
                ", ck='" + ck + '\'' +
                '}';
    }
}
