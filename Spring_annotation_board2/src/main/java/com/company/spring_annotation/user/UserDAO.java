package com.company.spring_annotation.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.spring_annotation.common.JDBCUtil;
import com.company.spring_annotation.common.PasswordEncryptUtil;

public class UserDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private final String USER_GET = "SELECT * FROM USERS WHERE User_Id=? AND User_Password=?";
    private final String USER_INSERT = "INSERT INTO USERS(User_Id, User_Password, User_Name, User_Email, User_Address, User_Phone, User_Mileage) VALUES(?,?,?,?,?,?,?)";

    // 회원 정보 조회 메소드
    public UserDO getUser(UserDO userDO) {
        UserDO user = null;

        try {
            System.out.println("===> getUser() 메소드 처리됨.");

            conn = JDBCUtil.getConnection();
            if (conn == null) {
                // 데이터베이스 연결 실패에 대한 예외 처리 로직
                throw new Exception("데이터베이스 연결에 실패했습니다.");
            }

            pstmt = conn.prepareStatement(USER_GET);
            pstmt.setString(1, userDO.getUser_Id());
            pstmt.setString(2, userDO.getUser_Password());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserDO();
                user.setUser_Id(rs.getString("User_Id"));
                user.setUser_Password(rs.getString("User_Password"));
                user.setUser_Name(rs.getString("User_Name"));
                user.setUser_Email(rs.getString("User_Email"));
                user.setUser_Address(rs.getString("User_Address"));
                user.setUser_Phone(rs.getString("User_Phone"));
                user.setUser_Mileage(rs.getInt("User_Mileage"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }
        return user;
    }

    // 회원가입 데이터 등록 메소드
    public void insertUser(UserDO userDO) {
        System.out.println("===> insertUser() 메소드 처리 완료");

        try {
            conn = JDBCUtil.getConnection();
            if (conn == null) {
                // 데이터베이스 연결 실패에 대한 예외 처리 로직
                throw new Exception("데이터베이스 연결에 실패했습니다.");
            }

            pstmt = conn.prepareStatement(USER_INSERT);
            pstmt.setString(1, userDO.getUser_Id());
            
            // 패스워드 암호화
            String plainText = userDO.getUser_Password();
            String pwEncrypt = PasswordEncryptUtil.encryptSHA256(plainText);
            pstmt.setString(2, pwEncrypt);

            pstmt.setString(3, userDO.getUser_Name());
            pstmt.setString(4, userDO.getUser_Email());
            pstmt.setString(5, userDO.getUser_Address());
            pstmt.setString(6, userDO.getUser_Phone());
            pstmt.setInt(7, userDO.getUser_Mileage());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(pstmt, conn);
        }
    }
}
