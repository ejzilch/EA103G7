package com.meal_order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.meal_order_detail.model.MealOrderDetailDAO;
import com.meal_order_detail.model.MealOrderDetailJDBCDAO;
import com.meal_order_detail.model.MealOrderDetailVO;

import jdbc.util.CompositeQuery.CompositeQuery;

public class MealOrderDAO implements MealOrderDAO_interface {

	private static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/EA103G7");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	private static final String INSERT = "INSERT INTO MEAL_ORDER(MEAL_ORDER_NO,MEM_NO,EMP_NO,MEAL_ORDER_STS,AMOUNT,ORDER_TIME,NOTI_STS,PAY_STS,PICKUP_TIME) VALUES ('MEO' || LPAD(SEQ_MEAL_ORDER_NO.NEXTVAL,4,0),?,?,?,?,CURRENT_TIMESTAMP,?,?,?)";
	private static final String UPDATE = "UPDATE MEAL_ORDER SET MEAL_ORDER_STS=?,NOTI_STS=?,PAY_STS=? WHERE MEAL_ORDER_NO=?";
	private static final String GETONE = "SELECT * FROM MEAL_ORDER WHERE MEAL_ORDER_NO = ?";
	private static final String GETBYORDERSTS = "SELECT * FROM MEAL_ORDER WHERE MEAL_ORDER_STS = ?";
	private static final String GETBYNOTISTS = "SELECT * FROM MEAL_ORDER WHERE NOTI_STS = ?";
	private static final String GETBYPAYSTS = "SELECT * FROM MEAL_ORDER WHERE PAY_STS = ?";
	private static final String GETALL = "SELECT * FROM MEAL_ORDER ORDER BY MEAL_ORDER_NO";

	public Map<String,Object>  insert(MealOrderVO mealOrderVO, List<MealOrderDetailVO> detailList, Connection... rescon) {
		
		Map<String,Object> map = new HashMap<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String orderNo = null;
		Timestamp orderTime = null;

		try {
			if (rescon.length != 0) {
				con = rescon[0];
			} else {
				con = ds.getConnection();
			}
			con.setAutoCommit(false);
			String[] col = { "MEAL_ORDER_NO", "ORDER_TIME" };
			pstmt = con.prepareStatement(INSERT, col);

			pstmt.setString(1, mealOrderVO.getMem_no());
			pstmt.setString(2, mealOrderVO.getEmp_no());
			pstmt.setInt(3, mealOrderVO.getMeal_order_sts());
			pstmt.setInt(4, mealOrderVO.getAmount());
			pstmt.setInt(5, mealOrderVO.getNoti_sts());
			pstmt.setInt(6, mealOrderVO.getPay_sts());
			pstmt.setTimestamp(7, mealOrderVO.getPickup_time());
			pstmt.execute();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				orderNo = rs.getString(1);
				orderTime = rs.getTimestamp(2);
				mealOrderVO.setMeal_order_no(orderNo);
				mealOrderVO.setOrder_time(orderTime);
//				System.out.println("MEAL_ORDER_NO = " + orderNo);
			}

			MealOrderDetailDAO detailDAO = new MealOrderDetailDAO();
			for (MealOrderDetailVO detailVO : detailList) {
				detailVO.setMeal_order_no(orderNo);
				detailDAO.insert(detailVO, con);
			}
			map.put("mealOrderVO", mealOrderVO);
			map.put("con",con);

			con.commit();
			return map;

		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (rescon.length == 0&&con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	};

	public void update(MealOrderVO mealOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, mealOrderVO.getMeal_order_sts());
			pstmt.setInt(2, mealOrderVO.getNoti_sts());
			pstmt.setInt(3, mealOrderVO.getPay_sts());
			pstmt.setString(4, mealOrderVO.getMeal_order_no());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};

	public MealOrderVO searchByOrderNo(String mealOrderNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETONE);
			pstmt.setString(1, mealOrderNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(mealOrderNo);
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));

			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return mealOrderVO;
	};

	public List<MealOrderVO> searchByOrderSts(Integer orderSts) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETBYORDERSTS);
			pstmt.setInt(1, orderSts);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(rs.getString("meal_order_no"));
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(mealOrderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};

	public List<MealOrderVO> searchByNotiSts(Integer notiSts) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETBYNOTISTS);
			pstmt.setInt(1, notiSts);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(rs.getString("meal_order_no"));
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(mealOrderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};

	public List<MealOrderVO> searchByPaySts(Integer paySts) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETBYPAYSTS);
			pstmt.setInt(1, paySts);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(rs.getString("meal_order_no"));
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(mealOrderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};

	public List<MealOrderVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(rs.getString("meal_order_no"));
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(mealOrderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};
	
	public List<MealOrderVO> getAll(Map<String,String[]> queryMap) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MealOrderVO mealOrderVO = null;
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();

		try {
			con = ds.getConnection();
			String queryAll ="SELECT * FROM MEAL_ORDER " + CompositeQuery.getWhereCondition(queryMap) + "ORDER BY MEAL_ORDER_NO";
//			System.out.println(queryAll);
			pstmt = con.prepareStatement(queryAll);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMeal_order_no(rs.getString("meal_order_no"));
				mealOrderVO.setMem_no(rs.getString("mem_no"));
				mealOrderVO.setEmp_no(rs.getString("emp_no"));
				mealOrderVO.setMeal_order_sts(rs.getInt("meal_order_sts"));
				mealOrderVO.setAmount(rs.getInt("amount"));
				mealOrderVO.setOrder_time(rs.getTimestamp("order_time"));
				mealOrderVO.setNoti_sts(rs.getInt("noti_sts"));
				mealOrderVO.setPay_sts(rs.getInt("pay_sts"));
				mealOrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(mealOrderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	};

}
