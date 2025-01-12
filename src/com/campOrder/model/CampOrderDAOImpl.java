package com.campOrder.model;

import java.sql.Connection;
<<<<<<< HEAD
import java.util.Date;
=======
import java.sql.Date;
>>>>>>> 7890843d354c84c1d315f9810be7b06ed74d70a2
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.campAreaOrderDetail.model.CampAreaOrderDetailVO;
import com.campBooking.model.CampBookingDAO;
import com.campBooking.model.CampBookingDAOImpl;
import com.campBooking.model.CampBookingVO;

<<<<<<< HEAD
import util.DiffDays;
=======
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

>>>>>>> Alice
import util.Util;

public class CampOrderDAOImpl implements CampOrderDAO {
	private static final String INSERTORDER_STMT = "INSERT INTO camp_order(camp_id, member_id, camp_order_status, camp_order_total_amount, camp_check_out_date, camp_check_in_date, credit_card_num,payer_name,payer_phone,camp_order_confirmed_time,camp_order_completed_time,camp_comment_star,camp_comment,camp_order_comment_time) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?)";
	private static final String INSERTDETAIL_STMT = "INSERT INTO camp_area_order_detail(camp_area_id,camp_order_id,booking_quantity,camp_area_weekday_price,camp_area_holiday_price,capitation_quantity,per_capitation_fee,booking_weekdays,booking_holidays) VALUES (?,?,?,?,?,?,?,?,?)";
	private static final String UPDATEBOOKING_STMT = "UPDATE camp_area_order_detail SET booked_camp_area_num=? where camp_id=? and camp_area_id=?  and date=?";

	private static final String UPDATE_STMT = "UPDATE camp_order SET camp_id = ?, member_id = ?, camp_order_status = ?, camp_order_total_amount = ?, camp_check_out_date= ?, camp_check_in_date = ? ,credit_card_num= ? ,payer_name= ? ,payer_phone=?,camp_order_confirmed_time=?,camp_order_completed_time=?,camp_comment_star=?,camp_comment=?,camp_order_comment_time=? WHERE camp_order_id = ?";

	private static final String DELETE_ORDER = "DELETE FROM camp_order WHERE camp_order_id = ?";
	private static final String DELETE_ORDERDETAIL = "DELETE FROM camp_order_detail WHERE camp_order_id = ?";

	private static final String FIND_BY_PK = "SELECT * FROM camp_order WHERE camp_order_id= ?";
<<<<<<< HEAD
	private static final String GET_ALL = "SELECT * FROM camp_order";
<<<<<<< HEAD
=======
	private static final String GET_ALL = "SELECT * FROM camp_order order by ";
>>>>>>> 7890843d354c84c1d315f9810be7b06ed74d70a2
	private static final String FIND_HOTCAMP = "SELECT camp_id,(sum(camp_comment_star)/count(*)) as 'avg_star',count(*) as 'compl_ordernum' FROM campingParadise.camp_order where camp_order_completed_time is not null group by camp_id order by compl_ordernum desc,avg_star desc";

=======
	private static final String FIND_BY_PARAMS = "SELECT * FROM camp_order where  camp_order_confirmed_time >=? and camp_order_confirmed_time <= ? and camp_order_status=? ";
	private static final String FIND_BY_PARAMS_NO_STATUS = "SELECT * FROM camp_order where  camp_order_confirmed_time >=? and camp_order_confirmed_time <= ? ";
	
	private static DataSource ds = null;
>>>>>>> Alice
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/David");
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException | NamingException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public void add(CampOrderVO campOrderVO, CampAreaOrderDetailVO... DetailVOs) {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		try {
<<<<<<< HEAD
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt1 = con.prepareStatement(INSERTORDER_STMT, PreparedStatement.RETURN_GENERATED_KEYS);
			con.setAutoCommit(false);
//新增訂單
			pstmt1.setInt(1, campOrderVO.getCampId());
			pstmt1.setInt(2, campOrderVO.getMemberId());
			pstmt1.setInt(3, campOrderVO.getCampOrderStatus());
			pstmt1.setInt(4, campOrderVO.getCampOrderTotalAmount());
			pstmt1.setDate(5, campOrderVO.getCampCheckOutDate());
			pstmt1.setDate(6, campOrderVO.getCampCheckInDate());
			pstmt1.setString(7, campOrderVO.getCreditCardNum());
			pstmt1.setString(8, campOrderVO.getPayerName());
			pstmt1.setString(9, campOrderVO.getPayerPhone());
			pstmt1.setTimestamp(10, campOrderVO.getCampOrderConfirmedTime());
			pstmt1.setTimestamp(11, campOrderVO.getCampOrderCompletedTime());
			pstmt1.setInt(12, campOrderVO.getCampCommentStar());
			pstmt1.setString(13, campOrderVO.getCampComment());
			pstmt1.setTimestamp(14, campOrderVO.getCampOrderCommentTime());

			pstmt1.executeUpdate();
//取得自增主鍵
			int mainkey = 0;
			ResultSet rs = pstmt1.getGeneratedKeys();
			if (rs.next()) {
				mainkey = rs.getInt(1);
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
//新增訂單明細
			pstmt2 = con.prepareStatement(INSERTDETAIL_STMT);
			for (int i = 0; i < DetailVOs.length; i++) {
				pstmt2.setInt(1, DetailVOs[i].getCampAreaId());
				pstmt2.setInt(2, mainkey);
				pstmt2.setInt(3, DetailVOs[i].getBookingQuantity());
				pstmt2.setInt(4, DetailVOs[i].getCampAreaWeekdayPrice());
				pstmt2.setInt(5, DetailVOs[i].getCampAreaHolidayPrice());
				pstmt2.setInt(6, DetailVOs[i].getCapitationQuantity());
				pstmt2.setInt(7, DetailVOs[i].getPerCapitationFee());
				pstmt2.setInt(8, DetailVOs[i].getBookingWeekdays());
				pstmt2.setInt(9, DetailVOs[i].getBookingHolidays());
				pstmt2.addBatch();
			}
			pstmt2.executeBatch();

//新增日程表訂位表格，針對每個營地每個營位每個日期做訂位數量修改，判斷當天剩餘空位是否大於訂位帳數
			pstmt3 = con.prepareStatement(UPDATEBOOKING_STMT);
			java.sql.Date checkin = campOrderVO.getCampCheckInDate();
			java.sql.Date checkout = campOrderVO.getCampCheckOutDate();
			List<java.util.Date> list = DiffDays.getDates(checkin, checkout);

			CampBookingDAO bookdao = new CampBookingDAOImpl();
            SimpleDateFormat sdf=new  SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < DetailVOs.length; i++) {
				for (java.util.Date days : list) {
					List<CampBookingVO> booklist = bookdao.findByAllArea(campOrderVO.getCampId(), sdf.format(days));
					CampBookingVO target = null;
					for (CampBookingVO item : booklist) {
						if (item.getCampAreaId() == DetailVOs[i].getCampAreaId()) {
							target = item;
							break;
						}

					}
					// 這個營位的這一天剩餘空位數
					int lastAreaNum = target.getBookingCampAreaMax() - target.getBookedCampAreaNum();

					if (DetailVOs[i].getBookingQuantity() <= lastAreaNum) {
						pstmt3.setInt(1, DetailVOs[i].getBookingQuantity());
						pstmt3.setInt(2, campOrderVO.getCampId());
						pstmt3.setInt(3, DetailVOs[i].getCampAreaId());
						pstmt3.setDate(4, new java.sql.Date(days.getTime()));
						pstmt3.addBatch();
					} else {
						throw new Exception();
					}
				}
			}
			pstmt3.executeBatch();

			con.commit();
=======
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, campOrderVO.getCampId());
			pstmt.setInt(2, campOrderVO.getMemberId());
			pstmt.setInt(3, campOrderVO.getCampOrderStatus());
			pstmt.setInt(4, campOrderVO.getCampOrderTotalAmount());
			pstmt.setDate(5, campOrderVO.getCampCheckOutDate());
			pstmt.setDate(6, campOrderVO.getCampCheckInDate());
			pstmt.setString(7, campOrderVO.getCreditCardNum());
			pstmt.setString(8, campOrderVO.getPayerName());
			pstmt.setString(9, campOrderVO.getPayerPhone());
			pstmt.setTimestamp(10, campOrderVO.getCampOrderConfirmedTime());
			pstmt.setTimestamp(11, campOrderVO.getCampOrderCompletedTime());
			pstmt.setInt(12, campOrderVO.getCampCommentStar());
			pstmt.setString(13, campOrderVO.getCampComment());
			pstmt.setTimestamp(14, campOrderVO.getCampOrderCommentTime());
			pstmt.executeUpdate();
>>>>>>> Alice

		} catch (Exception se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			se.printStackTrace();

		} finally {
			if (pstmt3 != null) {
				try {
					pstmt3.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt1 != null) {
				try {
					pstmt1.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}

		}

	}

	@Override
	public void update(CampOrderVO campOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(1, campOrderVO.getMemberId());
			pstmt.setInt(2, campOrderVO.getCampOrderStatus());
			pstmt.setInt(3, campOrderVO.getCampOrderTotalAmount());
			pstmt.setDate(4, campOrderVO.getCampCheckOutDate());
			pstmt.setDate(5, campOrderVO.getCampCheckInDate());
			pstmt.setString(6, campOrderVO.getCreditCardNum());
			pstmt.setString(7, campOrderVO.getPayerName());
			pstmt.setString(8, campOrderVO.getPayerPhone());
			pstmt.setTimestamp(9, campOrderVO.getCampOrderConfirmedTime());
			pstmt.setTimestamp(10, campOrderVO.getCampOrderCompletedTime());
			pstmt.setInt(11, campOrderVO.getCampCommentStar());
			pstmt.setString(12, campOrderVO.getCampComment());
			pstmt.setTimestamp(13, campOrderVO.getCampOrderCommentTime());
			pstmt.setInt(14, campOrderVO.getCampId());

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
	public void delete(Integer campOrderId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_ORDERDETAIL);
			pstmt.setInt(1, campOrderId);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(DELETE_ORDER);
			pstmt.setInt(1, campOrderId);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			se.printStackTrace();
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
	public CampOrderVO findByPK(Integer campOrderId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CampOrderVO campOrderVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, campOrderId);
			rs = pstmt.executeQuery();
			campOrderVO = new CampOrderVO();
			while (rs.next()) {
				campOrderVO.setCampOrderId(rs.getInt(1));
				campOrderVO.setCampId(rs.getInt(2));
				campOrderVO.setMemberId(rs.getInt(3));
				campOrderVO.setCampOrderStatus(rs.getInt(4));
				campOrderVO.setCampOrderTotalAmount(rs.getInt(5));
				campOrderVO.setCampCheckOutDate(rs.getDate(6));
				campOrderVO.setCampCheckInDate(rs.getDate(7));
				campOrderVO.setCreditCardNum(rs.getString(8));
				campOrderVO.setPayerName(rs.getString(9));
				campOrderVO.setPayerPhone(rs.getString(10));
				campOrderVO.setCampOrderConfirmedTime(rs.getTimestamp(11));
				campOrderVO.setCampOrderCompletedTime(rs.getTimestamp(12));
				campOrderVO.setCampCommentStar(rs.getInt(13));
				campOrderVO.setCampComment(rs.getString(14));
				campOrderVO.setCampOrderCommentTime(rs.getTimestamp(15));
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

		return campOrderVO;
	}
	
	@Override
	public List<CampOrderVO> findByParams(int statusnum,Date startDate,Date endDate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CampOrderVO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			String sql= FIND_BY_PARAMS;
			if (statusnum == -1) {
				sql = FIND_BY_PARAMS_NO_STATUS;
			}
			pstmt = con.prepareStatement(sql);
			java.sql.Date startSqlDate = new java.sql.Date(startDate.getTime());
			pstmt.setDate(1, startSqlDate);
			java.sql.Date endSqlDate = new java.sql.Date(endDate.getTime());
			pstmt.setDate(2, endSqlDate);
			if (statusnum != -1) {
			  pstmt.setInt(3, statusnum);
			}
			
			CampOrderVO campOrderVO = null;
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				campOrderVO = new CampOrderVO();
				campOrderVO.setCampOrderId(rs.getInt(1));
				campOrderVO.setCampId(rs.getInt(2));
				campOrderVO.setMemberId(rs.getInt(3));
				campOrderVO.setCampOrderStatus(rs.getInt(4));
				campOrderVO.setCampOrderTotalAmount(rs.getInt(5));
				campOrderVO.setCampCheckOutDate(rs.getDate(6));
				campOrderVO.setCampCheckInDate(rs.getDate(7));
				campOrderVO.setCreditCardNum(rs.getString(8));
				campOrderVO.setPayerName(rs.getString(9));
				campOrderVO.setPayerPhone(rs.getString(10));
				campOrderVO.setCampOrderConfirmedTime(rs.getTimestamp(11));
				campOrderVO.setCampOrderCompletedTime(rs.getTimestamp(12));
				campOrderVO.setCampCommentStar(rs.getInt(13));
				campOrderVO.setCampComment(rs.getString(14));
				campOrderVO.setCampOrderCommentTime(rs.getTimestamp(15));
				list.add(campOrderVO);
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

		return list;
	}

	@Override
	public List<CampOrderVO> getAll(Integer... sortmethed) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CampOrderVO campOrderVO = null;
		List<CampOrderVO> list = new ArrayList<>();
		StringBuffer buf = new StringBuffer();
		try {
<<<<<<< HEAD
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
=======

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			if (sortmethed.length != 0) {
				for (Integer ordernumber : sortmethed) {
					switch (ordernumber) {
					case 0:
						buf.append("camp_order_id,");
						break;
					case 1:
						buf.append("camp_id,");
						break;
					case 2:
						buf.append("camp_order_status,");
						break;
					case 3:
						buf.append("camp_check_out_date desc,");
						break;
					case 4:
						buf.append("camp_check_in_date desc,");
						break;
					case 5:
						buf.append("camp_order_comment_time desc,");
						break;
					default:
						buf.append("camp_order_id,");
					}

				}
			} else {
				buf.append("camp_order_id,");
			}

			String sorted = buf.toString().substring(0, buf.length() - 1);


			pstmt = con.prepareStatement(GET_ALL + "" + sorted);

>>>>>>> 7890843d354c84c1d315f9810be7b06ed74d70a2
			rs = pstmt.executeQuery();

			while (rs.next()) {
				campOrderVO = new CampOrderVO();
				campOrderVO.setCampOrderId(rs.getInt(1));
				campOrderVO.setCampId(rs.getInt(2));
				campOrderVO.setMemberId(rs.getInt(3));
				campOrderVO.setCampOrderStatus(rs.getInt(4));
				campOrderVO.setCampOrderTotalAmount(rs.getInt(5));
				campOrderVO.setCampCheckOutDate(rs.getDate(6));
				campOrderVO.setCampCheckInDate(rs.getDate(7));
				campOrderVO.setCreditCardNum(rs.getString(8));
				campOrderVO.setPayerName(rs.getString(9));
				campOrderVO.setPayerPhone(rs.getString(10));
				campOrderVO.setCampOrderConfirmedTime(rs.getTimestamp(11));
				campOrderVO.setCampOrderCompletedTime(rs.getTimestamp(12));
				campOrderVO.setCampCommentStar(rs.getInt(13));
				campOrderVO.setCampComment(rs.getString(14));
				campOrderVO.setCampOrderCommentTime(rs.getTimestamp(15));
				list.add(campOrderVO);
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

		return list;
	}

	@Override
	public List<Integer> findhotcamp() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> list = new ArrayList<Integer>();

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_HOTCAMP);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Integer campId = rs.getInt(1);
				list.add(campId);
			}
		} catch (SQLException se) {
			se.printStackTrace();
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

		return list;
	}

}
