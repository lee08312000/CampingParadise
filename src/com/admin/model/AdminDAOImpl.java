package com.admin.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import util.Util;

public class AdminDAOImpl implements AdminDAO {
	private static final String INSERT_STMT = "INSERT INTO admin(admin_id, admin_account_status, admin_account, admin_password) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE admin SET admin_account_status = ?, admin_account = ?, admin_password = ?, WHERE admin_id = ?";
	private static final String DELETE_STMT = "DELETE FROM admin WHERE admin_id = ?";
	private static final String FIND_BY_PK = "SELECT * FROM admin WHERE admin_id = ?";
	private static final String GET_ALL = "SELECT * FROM admin";
	
	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void add(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, adminVO.getAdminId());
			pstmt.setInt(2, adminVO.getAdminAccountStatus());
			pstmt.setString(3, adminVO.getAdminAccount());
			pstmt.setString(4, adminVO.getAdminPassword());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, adminVO.getAdminAccountStatus());
			pstmt.setString(2, adminVO.getAdminAccount());
			pstmt.setString(3, adminVO.getAdminPassword());
			pstmt.setInt(4, adminVO.getAdminId());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(int adminId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, adminId);
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public AdminVO findByPK(int adminId) { //回傳一個員工的物件
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, adminId);
			rs = pstmt.executeQuery(); //select相關用這個

			while (rs.next()) {
				adminVO = new AdminVO(); //物件建立的動作，建立Employee Bean,準備包裝著從資料庫查詢出來的部門資料
				// emp.setEmpno(empno);設定後直接回傳值回去
				adminVO.setAdminId(rs.getInt("admin_id"));
				adminVO.setAdminAccountStatus(rs.getInt("admin_account_status"));
				adminVO.setAdminAccount(rs.getString("admin_account"));
				adminVO.setAdminPassword(rs.getString("admin_password"));
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		

		return adminVO; //不要忘了這個 要替換成迴圈裡的部門物件
	}

	@Override
	public List<AdminVO> getAll() {
		List<AdminVO> adminList = new ArrayList<>();
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setAdminId(rs.getInt("admin_id"));
				adminVO.setAdminAccountStatus(rs.getInt("admin_account_status"));
				adminVO.setAdminAccount(rs.getString("admin_account"));
				adminVO.setAdminPassword(rs.getString("admin_password"));
				adminList.add(adminVO);

			}

		} catch (SQLException se) {
			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return adminList;
	}

	
	
	
	
//	public static void main(String[] args) {
//	
//	ProductReportVO productReportVO = new ProductReportVO();
//	ProductReportDAO dao = new ProductReportDAOImpl();
//	// insert 測試
//	
//	productReportVO.setMemberId(1);
//	productReportVO.setProductId(4);
//	productReportVO.setReportReason("太醜了!!!!");
//	
//	dao.insert(productReportVO);
	
	// delete 測試
//	dao.delete(2);
	
	// update 測試
//	productReportVO.setMemberId(2);
//	productReportVO.setProductId(2);
//	productReportVO.setReportReason("lol");
//	productReportVO.setReportStatus(1);
//	productReportVO.setProductReportId(3);
//	
//	dao.update(productReportVO);

	// findByPrimaryKey 測試
//	productReportVO = dao.findByPrimaryKey(4);
//	
//	System.out.println(productReportVO.getProductReportId());
//	System.out.println(productReportVO.getMemberId());
//	System.out.println(productReportVO.getProductId());
//	System.out.println(productReportVO.getReportTime());
//	System.out.println(productReportVO.getReportReason());
//	System.out.println(productReportVO.getReportStatus());
	
	// getAll 測試
//	List<ProductReportVO> list = dao.getAll();
//	
//	for (ProductReportVO p : list) {
//		System.out.println(p.getProductReportId());
//		System.out.println(p.getMemberId());
//		System.out.println(p.getProductId());
//		System.out.println(p.getReportTime());
//		System.out.println(p.getReportReason());
//		System.out.println(p.getReportStatus());
//		System.out.println("========================");
//	}
//	
//}

}

