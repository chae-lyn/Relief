package com.kh.relief.account.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.relief.account.model.vo.Account;
import com.kh.relief.account.model.vo.T_Status;
import com.kh.relief.board.model.vo.Board;
import com.kh.relief.common.PageInfo;

@Repository
public class MyPageDaoImpl implements MyPageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectWishListCount(String account_id) {
		return sqlSession.selectOne("mypageMapper.selectWishListCount", account_id);
	}
	
	@Override
	public List<Board> selectWishList(PageInfo pi, String account_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectWishList", account_id, rowBounds);
	}
	
	@Override
	public int deleteWish(int pk_Id) {
		return sqlSession.delete("mypageMapper.deleteWish", pk_Id);
	}
	
	@Override
	public int selectPHListCount(String consumer_id) {
		return sqlSession.selectOne("mypageMapper.selectPHListCount", consumer_id);
	}
	
	@Override
	public List<Board> selectPHList(PageInfo pi, String consumer_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectPHList", consumer_id, rowBounds);
	}

	@Override
	public int deleteT_History(int t_history_id) {
		return sqlSession.delete("mypageMapper.deleteT_History", t_history_id);
	}

	@Override
	public int selectHiddenListCount(String seller_id) {
		return sqlSession.selectOne("mypageMapper.selectHiddenListCount", seller_id);
	}

	@Override
	public List<Board> selectselectHiddenList(PageInfo pi, String seller_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectselectHiddenList", seller_id, rowBounds);
	}

	@Override
	public int unHide(int t_history_id) {
		return sqlSession.update("mypageMapper.unHide", t_history_id);
	}

	@Override
	public int selectSalesListCount(String seller_id) {
		return sqlSession.selectOne("mypageMapper.selectSalesListCount", seller_id);
	}

	@Override
	public List<Board> selectSalesList(PageInfo pi, String seller_id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectSalesList", seller_id, rowBounds);
	}

	@Override
	public int statusUpdate(T_Status t_status) {
		return sqlSession.update("mypageMapper.statusUpdate", t_status);
	}

	@Override
	public String matchesPwd(Account account) {
		return sqlSession.selectOne("mypageMapper.matchesPwd", account);
	}

	@Override
	public int deleteMember(String aid) {
		return sqlSession.update("mypageMapper.deleteMember", aid);
	}

	@Override
	public Account memberInfo(Account a) {
		return sqlSession.selectOne("mypageMapper.memberInfo", a);
	}

	@Override
	public int updateMember(Account a, boolean flag) {
		if(flag) {
			return sqlSession.update("mypageMapper.updateMember1", a);
		} else {
			return sqlSession.update("mypageMapper.updateMember2", a);
		}
		
	}

	@Override
	public int updatePull_Date(int board_id) {
		return sqlSession.update("mypageMapper.updatePull_Date", board_id);
	}

}
