package com.company.spring_annotation.user;

public class UserDO {
    // 멤버
    private String user_Id;
    private String user_Name;
    private String user_Email;
    private String user_Password;
    private String user_Address;
    private String user_Phone;
    private int user_Mileage;

    public String getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(String user_Id) {
        this.user_Id = user_Id;
    }

    public String getUser_Name() {
        return user_Name;
    }

    public void setUser_Name(String user_Name) {
        this.user_Name = user_Name;
    }

    public String getUser_Email() {
        return user_Email;
    }

    public void setUser_Email(String user_Email) {
        this.user_Email = user_Email;
    }

    public String getUser_Password() {
        return user_Password;
    }

    public void setUser_Password(String user_Password) {
        this.user_Password = user_Password;
    }

    public String getUser_Address() {
        return user_Address;
    }

    public void setUser_Address(String user_Address) {
        this.user_Address = user_Address;
    }

    public String getUser_Phone() {
        return user_Phone;
    }

    public void setUser_Phone(String user_Phone) {
        this.user_Phone = user_Phone;
    }

    public int getUser_Mileage() {
        return user_Mileage;
    }

    public void setUser_Mileage(int user_Mileage) {
        this.user_Mileage = user_Mileage;
    }
}
